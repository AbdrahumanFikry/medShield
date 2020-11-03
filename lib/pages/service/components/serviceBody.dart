import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/profile/components/profileInfo.dart';
import 'package:med_shield_new_version/pages/service/service_controller.dart';

class ServiceBody extends GetView<ServiceController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProfileInfo(
          icon: Icons.my_location,
          title: S.of(context).address,
          content: controller.service.value.address,
        ),
        ProfileInfo(
          icon: FontAwesomeIcons.userMd,
          title: S.of(context).specialization,
          content: controller.service.value.specialization,
        ),
        ProfileInfo(
          icon: FontAwesomeIcons.headset,
          title: S.of(context).telPhone,
          content: controller.service.value.mobile,
        ),
        ProfileInfo(
          icon: FontAwesomeIcons.phoneVolume,
          title: S.of(context).phoneNumber,
          content: controller.service.value.phone_1 ??
              '' + '\n' + controller.service.value.phone_2 ??
              '' + '\n' + controller.service.value.phone_3 ??
              '' + '\n',
        ),
      ],
    );
  }
}
