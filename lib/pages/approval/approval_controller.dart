import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:med_shield_api/api.dart';
import 'package:med_shield_api/model/approval_response.dart';
import 'package:med_shield_api/model/approval_types.dart';
import 'package:med_shield_api/model/approval_types_response.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/services/cacheService.dart';
import 'package:med_shield_new_version/utilities/apiUtil.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/pages/main/main_controller.dart';

class ApprovalController extends GetxController {
  TextEditingController emailController = TextEditingController();
  final approvalTypeController = RxString();
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  GlobalKey<FormState> approvalFormKey = GlobalKey<FormState>();
  final uploadedFiles = RxMap<String, Uint8List>({});
  final filesName = ''.obs;
  final typesFetched = false.obs;
  final approvalTypes = RxList<ApprovalTypes>([]);
  final CacheService cacheController;

  ApprovalController(
    this.cacheController,
  );

  bool get approvalTypeHasError =>
      approvalTypeController.value.isEmpty && AppService.to.hasError.value;

  MedShieldApi get api => Get.find();

  Future<void> getApproval() async {
    final formData = approvalFormKey.currentState;
    if (formData.validate() && !approvalTypeController.value.isEmpty) {
      formData.save();
      AppService.to.startNewService();
      final userData = AppService.to.user?.value;
      print('Email : ' + emailController.text);
      print('ApprovalType : ' + approvalTypeController.value);
      print('Address : ' + titleController.text);
      print('MoreDetails : ' + detailsController.text);
      final typeId = getTypeId(type: approvalTypeController.value);
      try {
        ApprovalResponse response = await APIUtil.request<ApprovalResponse>(
          future: api.getApprovalApi().approval(
                API_TOKEN: APIUtil.apiToken,
                platform: APIUtil.platform,
                platformToken: AppService.to.fireBaseToken.value ?? '',
                title: titleController.text,
                email: emailController.text,
                moreDetails: detailsController.text ?? null,
                dateOfBirth: userData?.date_of_birth ?? null,
                typeId: typeId,
                cardNumber: userData?.customer_number,
                files: uploadedFiles,
              ),
        );
        await MainController.to.getAllApprovals();
        Get.back(result: true);
      } catch (error) {
        AppUtil.showAlertDialog(body: error.toString());
      }
      AppService.to.endService();
    } else if (approvalTypeController.value.isEmpty) {
      AppService.to.endServiceWithError(S.current.inputNull);
    }
  }

  int getTypeId({String type}) {
    final typeObj = approvalTypes.firstWhere((element) => element.name == type);
    return typeObj.id;
  }

  Future<void> getApprovalTypes() async {
    try {
      ApprovalTypesResponse response =
          await APIUtil.request<ApprovalTypesResponse>(
        future: api.getApprovalApi().approvalTypes(APIUtil.apiToken),
      );
      approvalTypes.value = response.result.toList();
      typesFetched.value = true;
    } catch (error) {
      List<ApprovalTypes> cachedProviderTypes =
          await cacheController.selectorsRepo.getServiceProviderTypes();
      if (cachedProviderTypes != null || !cachedProviderTypes.isNullOrBlank) {
        approvalTypes.value = cachedProviderTypes;
        typesFetched.value = true;
      } else {
        AppUtil.showAlertDialog(body: error.toString());
      }
    }
  }

  Future<void> attachFiles() async {
    try {
      List<File> result = await FilePicker.getMultiFile(type: FileType.any);
      if (result != null) {
        List<Uint8List> files = result.map(
          (file) {
            File temp = file;
            Uint8List bytes = temp.readAsBytesSync();
            uploadedFiles[temp.path.split("/").last] = bytes;
            return bytes;
          },
        ).toList();
        filesName.value = S.current.filesUploaded(uploadedFiles.length);
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (error) {
      throw error.toString();
    }
  }

  void emptyFiles() {
    FilePicker.clearTemporaryFiles();
    uploadedFiles.value = {};
    filesName.value = '';
  }

  @override
  void onInit() {
    getApprovalTypes();
    uploadedFiles.value = {};
    filesName.value = '';
    emailController.clear();
    typesFetched.value = false;
    approvalTypeController.value = '';
    titleController.clear();
    detailsController.clear();
    AppService.to.hasError.value = false;
  }

  @override
  onClose() {
    AppService.to.endService();
    super.onClose();
  }
}
