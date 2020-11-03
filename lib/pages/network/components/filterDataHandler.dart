import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appDropDownMenu.dart';
import 'package:med_shield_new_version/pages/network/network_controller.dart';
import 'package:med_shield_new_version/services/appService.dart';

class FilterDataHandler extends GetView<NetworkController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.approvalTypes.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        List data = controller.approvalTypes[index];
        return data.length == 0
            ? SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: Obx(
                  () => AppDropDownMenu(
                    listElements: controller.approvalTypes[index]
                        .map((type) => (type.name == null
                            ? ''
                            : type.name.length > controller.wordCount
                                ? '...' +
                                    type.name.substring(0, controller.wordCount)
                                : type.name ?? ''))
                        .toList(),
                    onChanged: (String value) {
                      String typeId = controller.getTypeId(
                        type: value,
                        targetList: data,
                      );
                      controller.selectedApprovalTypes[index] = typeId;
                    },
                    hintText: controller.selectedApprovalTypes[index] ??
                        controller.placeHolder[index],
                    validator: AppService.to.validator,
                  ),
                ),
              );
      },
    );
  }
}
