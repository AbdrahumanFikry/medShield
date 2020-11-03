import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:shimmer/shimmer.dart';

class Waiting extends StatelessWidget {
  final int blockCount;

  Waiting({
    @required this.blockCount,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: ListView.builder(
        itemCount: blockCount ?? 1,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            Container(
              height: 75.0,
              width: Get.width,
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                borderRadius: AppUtil.borderRadius,
                color: ColorUtil.mediumGreyColor,
              ),
            ),
      ),
      baseColor: ColorUtil.lightGreyColor,
      highlightColor: Colors.white,
      enabled: true,
    );
  }
}
