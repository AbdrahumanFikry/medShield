import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/plainAppBar.dart';
import 'package:med_shield_new_version/pages/service/components/serviceBody.dart';
import 'package:med_shield_new_version/pages/service/components/serviceHeader.dart';
import 'package:med_shield_new_version/pages/service/service_controller.dart';

class ServiceView extends GetView<ServiceController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          appBar: PlainAppBar(
            barTitle: controller.service.value.name ?? '',
            enableBack: true,
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            children: <Widget>[
              ServiceHeader(),
              ServiceBody(),
            ],
          ),
        ),
      ),
    );
  }
}
