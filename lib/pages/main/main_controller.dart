import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_api/api.dart';
import 'package:med_shield_api/model/app_users_approvals_response.dart';
import 'package:med_shield_api/model/approval.dart';
import 'package:med_shield_new_version/pages/main/components/home.dart';
import 'package:med_shield_new_version/pages/main/components/more.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/services/cacheService.dart';
import 'package:med_shield_new_version/services/repositories/approvals/approval.dart';
import 'package:med_shield_new_version/utilities/apiUtil.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();
  AnimationController barAnimationController;

  MedShieldApi get api => Get.find();
  final isList = false.obs;
  StreamSubscription approvalsStream;
  final targetBody = Rx<Widget>();
  final allApprovals = RxList<ApprovalDto>([]);
  final mainLoading = false.obs;
  final CacheService cacheController;

  MainController(
    this.cacheController,
  );

  @override
  void onInit() {
    approvalsStream =
        cacheController.approvalRepo.dataBox.watch().listen((event) {
      var items = cacheController.approvalRepo.getAllValues().toList();
      var itemsCopy = items.toList();
      items.sort(
        (x, y) => cacheController.approvalRepo.getLatestDate(y).compareTo(
              cacheController.approvalRepo.getLatestDate(x),
            ),
      );
      var itemsNew = List<ApprovalDto>();
      for (int i = 0; i < itemsCopy.length; i++) {
        var item = itemsCopy[i];
        if (item.statues == 'new') {
          itemsNew.add(item);
          items.remove(item);
        }
      }
      allApprovals.assignAll(
        [
          ...itemsNew,
          ...items,
        ],
      );
    });
    getAllApprovals();
    targetBody.value = Home();
  }

  void handleListChanges() {
    isList.value = !isList.value;
    if (isList.value) {
      barAnimationController.forward();
      targetBody.value = More();
    } else {
      barAnimationController.reverse();
      targetBody.value = Home();
    }
  }

  Future<void> getAllApprovals() async {
    mainLoading.value = true;
    try {
      final response = await APIUtil.request<AppUsersApprovalsResponse>(
        future: api.getUserApi().userApproval(
              APIUtil.apiToken,
              appUserId: AppService.to.userId,
            ),
      );
      for (Approval approval in response.result) {
        await cacheController.approvalRepo.addToApprovals(approval);
      }
    } catch (error) {
      print(
        'Error fetching or cashing approvals! \n Error message : ' +
            error.toString(),
      );
    }
    mainLoading.value = false;
  }

  @override
  Future<void> onClose() async {
    await approvalsStream?.cancel();
    super.onClose();
  }
}
