import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appButton.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/loading.dart';
import 'package:med_shield_new_version/components/plainAppBar.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/profile/components/editingInputField.dart';
import 'package:med_shield_new_version/pages/profile/components/imageHandler.dart';
import 'package:med_shield_new_version/pages/profile/profile_controller.dart';
import 'package:med_shield_new_version/services/appService.dart';

class EditProfile extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          appBar: PlainAppBar(
            barTitle: S.of(context).editProfile,
            enableBack: true,
          ),
          body: Form(
            key: controller.editFormKey,
            child: Obx(() {
              final userData = AppService.to.user?.value;
              return ListView(
                children: <Widget>[
                  ProfileImageHandler(),
                  EditingInputField(
                    initialValue: userData?.email,
                    labelText: S.of(context).email,
                    hintText: S.of(context).email,
                    isLoading: AppService.to.loading.value,
                    validator: (String value) => AppService.to.validator(
                      value,
                      isEmail: true,
                    ),
                    onChanged: (String value) {
                      controller.emailController.value = value;
                    },
                  ),
                  EditingInputField(
                    initialValue: userData?.phone,
                    labelText: S.of(context).phoneNumber,
                    hintText: S.of(context).phoneNumber,
                    isLoading: AppService.to.loading.value,
                    validator: userData?.phone == null
                        ? null
                        : (String value) => AppService.to.validator(
                              value,
                              isPhone: true,
                            ),
                    onChanged: (String value) {
                      controller.phoneController.value = value;
                    },
                  ),
                  AppService.to.loading.value
                      ? Loading()
                      : AppButton(
                          title: S.of(context).edit,
                          onPressed: controller.editProfile,
                        ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
