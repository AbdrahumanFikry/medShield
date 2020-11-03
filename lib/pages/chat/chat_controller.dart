import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:easy_folder_picker/FolderPicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:med_shield_api/api.dart';
import 'package:med_shield_api/model/add_comment_response.dart';
import 'package:med_shield_new_version/pages/main/main_controller.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/services/cacheService.dart';
import 'package:med_shield_new_version/services/repositories/approvals/approval-repository.dart';
import 'package:med_shield_new_version/services/repositories/approvals/approval.dart';
import 'package:med_shield_new_version/services/repositories/approvals/approvalComments.dart';
import 'package:med_shield_new_version/utilities/apiUtil.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_api/model/app_users_approval_response.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/widgets.dart';

class ChatController extends GetxController {
  final CacheService cacheService;
  TextEditingController messageController = TextEditingController();
  final messageText = ''.obs;
  final sendingText = false.obs;
  final int approvalId;
  final approvalCached = Rx<ApprovalDto>(null);
  final toUpload = Map<String, File>().obs;

  ChatController(
    this.approvalId,
    this.cacheService,
  );

  static ChatController get to => Get.find();

  MedShieldApi get api => Get.find();

  Future<void> fetchApprovalData({bool noLoad = false}) async {
    if (!noLoad) AppService.to.startNewService();
    try {
      AppUsersApprovalResponse response =
          await APIUtil.request<AppUsersApprovalResponse>(
        future: api.getUserApi().userApprovalSingle(
              approvalId,
              APIUtil.apiToken,
              appUserId: AppService?.to?.userId,
            ),
      );
      approvalCached.value =
          await cacheService.approvalRepo.addToApprovals(response.result);
      await updateApprovalStatue();
    } catch (error) {
      AppUtil.showAlertDialog(body: error.toString());
    }
    AppService.to.endService();
  }

  Future<void> downloadFile(String url, String fileName) async {
    Directory newDirectory = await FolderPicker.pick(
      allowFolderCreation: true,
      context: Get.overlayContext,
      rootDirectory: Directory(
        Platform.isAndroid
            ? (await getExternalStorageDirectory()).path
            : (await getApplicationDocumentsDirectory()).path,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
    final newDir = newDirectory == null ? null : Directory(newDirectory.path);
    print(':::::::::::::::' + newDirectory.path);
    if (newDir != null && await newDir.exists()) {
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        fileName: fileName,
        savedDir: newDirectory.path,
        showNotification: true,
        openFileFromNotification: true,
      );
    }
  }

  Future<void> uploadImages() async {
    try {
      List<File> result = await FilePicker.getMultiFile(
        type: FileType.any,
      );

      if (result != null) {
        toUpload.addAll(
          Map.fromEntries(
            result.map(
              (x) => MapEntry(basename(x.path), x),
            ),
          ),
        );
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (error) {
      AppUtil.showAlertDialog(body: error.toString());
    }
  }

  void onSend() async {
    if (toUpload.isNotEmpty ||
        (messageText.value.length > 0 || !messageText.value.isNullOrBlank)) {
      print('message : ' + messageText.value.toString());
      final comment = ApprovalCommentsDto(
        id: -1,
        comment: toUpload.isNotEmpty && messageText.value.length == 0
            ? 'file'
            : messageText.value,
        replay_with: 'me',
      );
      approvalCached.update((val) {
        val.approval_comments.add(comment);
      });
      messageText.value = '';
      messageController.text = '';
      try {
        sendingText.value = true;
        final bytesMap = Map<String, Uint8List>();
        for (var f in toUpload.values) {
          final file = f;
          bytesMap[basename(f.path)] = await file.readAsBytes();
        }
        AddCommentResponse response = await APIUtil.request<AddCommentResponse>(
          future: api.getApprovalApi().userApprovalAddComment(
                approvalId,
                appUserId: AppService.to.userId,
                API_TOKEN: APIUtil.apiToken,
                comment: comment.comment,
                files: bytesMap,
              ),
        );
        approvalCached.update((val) {
          int index = val.approval_comments.indexWhere((old) => old.id == -1);
          val.approval_comments[index] =
              cacheService.approvalRepo.fromComment(response.result);
        });
        toUpload.clear();
      } catch (error) {
        approvalCached.update((val) {
          int index = val.approval_comments.indexWhere((old) => old.id == -1);
          val.approval_comments.removeAt(index);
        });
        AppUtil.showAlertDialog(body: error.toString());
      }
      sendingText.value = false;
    }
  }

  Future updateApprovalStatue() async {
    await cacheService.approvalRepo.updateStatues(
      approvalId,
      statues: Statues.Old,
    );
  }

  @override
  void onInit() {
    approvalCached.value = cacheService.approvalRepo.getValueById(approvalId);
    sendingText.value = false;
    messageText.value = '';
    print(approvalId);
    fetchApprovalData();
  }

  @override
  void onClose() {
    AppService.to.endService();
    messageController.dispose();
    sendingText.value = false;
    messageText.value = '';
    super.onClose();
  }
}
