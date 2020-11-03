import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appButton.dart';
import 'package:med_shield_new_version/components/emptyScreen.dart';
import 'package:med_shield_new_version/components/loading.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/search/components/filterDataHandler.dart';
import 'package:med_shield_new_version/pages/search/search_controller.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/components/waiting.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterDrawer extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.875,
      child: Drawer(
        elevation: 2.0,
        child: Obx(
          () => !controller.filtersFetched.value
              ? Waiting(
                  blockCount: 4,
                )
              : controller.isEmpty.value
                  ? EmptyScreen()
                  : ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                          child: Text(
                            S.of(context).filter,
                            style: TextStyle(
                              color: ColorUtil.primaryColor,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FilterDataHandler(),
                        AppService.to.loading.value
                            ? Loading()
                            : AppButton(
                                title: S.of(context).done,
                                onPressed: () async {
                                  Get.back(result: true);
                                  await controller.fetchFilterResult();
                                },
                              ),
                      ],
                    ),
        ),
      ),
    );
  }
}
