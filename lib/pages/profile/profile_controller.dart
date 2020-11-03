import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:med_shield_api/api.dart';
import 'package:med_shield_api/model/edit_profile_response.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/services/cacheService.dart';
import 'package:med_shield_new_version/services/repositories/user/user.dart';
import 'package:med_shield_new_version/utilities/apiUtil.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';

class ProfileController extends GetxController {
  final profileImage = Rx<File>();
  final uInt8ListImage = Rx<Uint8List>();
  final emailController = RxString();
  final phoneController = RxString();
  GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
  final userData = Rx<User>();

  MedShieldApi get api => Get.find();

  static ProfileController get to => Get.find();
  final CacheService cacheController;

  ProfileController({
    @required this.cacheController,
  });

  bool get dataChanged {
    if (profileImage.value != null ||
        emailController.value != null ||
        phoneController.value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> changeProfileImage() async {
    try {
      File result = await FilePicker.getFile(
        type: FileType.image,
      );
      if (result != null) {
        File file = result;
        profileImage.value = File(file.path);
        uInt8ListImage.value = profileImage.value.readAsBytesSync();
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (error) {
      throw error.toString();
    }
  }

  Future<void> editProfile() async {
    final formData = editFormKey.currentState;
    if (formData.validate() && dataChanged) {
      formData.save();
      AppService.to.startNewService();
      try {
        print('ProfileImagePath : ' +
            (profileImage.value ?? 'No image uploaded').toString());
        print('Email : ' + emailController.value.toString() ?? 'null');
        print('Phone : ' + phoneController.value.toString() ?? 'null');
        EditProfileResponse response =
            await APIUtil.request<EditProfileResponse>(
          future: api.getUserApi().userEditProfile(
                AppService.to.userId,
                API_TOKEN: APIUtil.apiToken,
                email: emailController.value ?? userData?.value?.email,
                mobile: phoneController.value ?? userData?.value?.phone,
                image: uInt8ListImage.value ?? null,
              ),
        );
        User user =
            await cacheController.userRepo.updateCacheFromApi(response.result);
        AppService.to.user.value = user;
        Get.back(result: true);
      } catch (error) {
        AppUtil.showAlertDialog(body: error.toString());
      }
      AppService.to.endService();
    } else if (!dataChanged) {
      AppUtil.showAlertDialog(body: S.current.noChangedData);
    }
  }

  @override
  void onInit() {
    emailController.value = null;
    phoneController.value = null;
    profileImage.value = null;
    uInt8ListImage.value = null;
    userData.value = AppService.to.user?.value;
  }

  @override
  onClose() {
    AppService.to.endService();
    super.onClose();
  }
}
