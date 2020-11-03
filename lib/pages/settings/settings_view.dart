import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/plainAppBar.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_shield_new_version/pages/settings/components/settingItem.dart';
import 'package:med_shield_new_version/pages/settings/settings_controller.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/utilities/pathUtil.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          appBar: PlainAppBar(
            barTitle: S.of(context).settings,
            enableBack: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingItem(
                title: S.of(context).language,
                onPressed: () => Get.toNamed(
                  Routes.SELECT_LANGUAGE,
                  arguments: true,
                ),
                trailing: SizedBox(
                  width: 75.w,
                  child: ClipPolygon(
                    sides: 6,
                    borderRadius: 5.0,
                    child: Container(
                      child: Image.asset(
                        controller.isAr ? PathUtil.egPath : PathUtil.ukPath,
                        fit: BoxFit.fill,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // SettingItem(
              //   title: S.of(context).clearCache,
              //   onPressed: () async => await controller.clearCache(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
