import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:med_shield_new_version/utilities/pathUtil.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30.h,
      ),
      child: Center(
        child: Lottie.asset(
          PathUtil.loading,
          height: 200.w,
          width: 200.w,
        ),
      ),
    );
  }
}
