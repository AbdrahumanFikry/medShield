import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/utilities/pathUtil.dart';

class SplashBody extends StatelessWidget {
  final Widget child;

  SplashBody({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: <Widget>[
          child,
          Positioned(
            bottom: 20.0,
            right: 0.0,
            left: 0.0,
            child: Text(
              S.of(context).copyRights,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
