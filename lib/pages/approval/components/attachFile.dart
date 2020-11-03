import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/approval/approval_controller.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttachFile extends GetView<ApprovalController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () async => await controller.attachFiles(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Icon(
              FontAwesomeIcons.paperclip,
              color: ColorUtil.secondaryColor,
              size: 40.sp,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: AppUtil.borderRadius,
              border: AppUtil.border,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            child: Obx(
              () => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.filesName.value.isEmpty
                        ? S.of(context).attachFile
                        : controller.filesName.value,
                    style: TextStyle(
                      color: ColorUtil.greyColor,
                      fontSize: 36.sp,
                    ),
                  ),
                  Spacer(),
                  controller.uploadedFiles.isEmpty
                      ? SizedBox.shrink()
                      : GestureDetector(
                          onTap: () async => await controller.emptyFiles(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Icon(
                              FontAwesomeIcons.trash,
                              color: ColorUtil.errorColor,
                              size: 36.sp,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
