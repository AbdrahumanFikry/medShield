import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Widget trailing;

  SettingItem({
    this.title,
    this.onPressed,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 10.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: ColorUtil.greyColor,
                    fontSize: trailing == null ? 32.sp : 38.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                if (trailing != null) trailing,
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Divider(
              color: ColorUtil.mediumGreyColor,
            ),
          ],
        ),
      ),
    );
  }
}
