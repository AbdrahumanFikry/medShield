import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:med_shield_new_version/utilities/pathUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum EmptyType {
  isNotification,
  isEmpty,
}

class EmptyScreen extends StatelessWidget {
  final String contentName;
  final EmptyType type;

  EmptyScreen({
    this.contentName,
    this.type = EmptyType.isEmpty,
  });

  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              type == EmptyType.isNotification
                  ? PathUtil.notification
                  : PathUtil.noData,
              height: 400.h,
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              S
                  .of(context)
                  .thisEmpty,
              style: TextStyle(
                color: ColorUtil.secondaryColor,
                fontSize: 44.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
