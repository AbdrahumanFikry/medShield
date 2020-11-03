import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/select_language/components/languageSelector.dart';
import 'package:med_shield_new_version/pages/select_language/select_language_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_shield_new_version/utilities/pathUtil.dart';

class SelectLanguageView extends GetView<SelectLanguageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 100.h,
                  bottom: 100.h,
                ),
                child: Text(
                  S.of(context).selectLanguageTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 38.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              LanguageSelector(
                title: 'عربى',
                imagePath: PathUtil.egPath,
                onSelect: () async {
                  await controller.changeLanguage(languageCode: 'ar');
                },
              ),
              LanguageSelector(
                title: 'English',
                imagePath: PathUtil.ukPath,
                onSelect: () async {
                  await controller.changeLanguage(languageCode: 'en');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
