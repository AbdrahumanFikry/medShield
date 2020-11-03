import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appButton.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/emptyScreen.dart';
import 'package:med_shield_new_version/components/loading.dart';
import 'package:med_shield_new_version/components/plainAppBar.dart';
import 'package:med_shield_new_version/components/waiting.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/network/components/filterDataHandler.dart';
import 'package:med_shield_new_version/pages/network/network_controller.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetworkView extends GetView<NetworkController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          appBar: PlainAppBar(
            barTitle: S.of(context).network,
            enableBack: true,
          ),
          body: Obx(
            () => !controller.filtersFetched.value
                ? Waiting(
                    blockCount: 4,
                  )
                : controller.isEmpty.value
                    ? EmptyScreen()
                    : ListView(
                        children: <Widget>[
                          FilterDataHandler(),
                          AppService.to.loading.value
                              ? Loading()
                              : AppButton(
                                  title: S.of(context).filter,
                                  onPressed: () async {
                                    await controller.fetchFilterResult();
                                  },
                                ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
