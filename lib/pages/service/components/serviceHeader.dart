import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_shield_new_version/pages/service/service_controller.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:octo_image/octo_image.dart';

class ServiceHeader extends GetView<ServiceController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: Get.width,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: ColorUtil.lightGreyColor,
        borderRadius: AppUtil.borderRadius,
      ),
      child: Stack(
        children: <Widget>[
          // ClipRRect(
          //   borderRadius: AppUtil.borderRadius,
          //   child: OctoImage(
          //     height: 400.h,
          //     width: double.infinity,
          //     image: CachedNetworkImageProvider(
          //       'https://blurha.sh/assets/images/img1.jpg',
          //     ),
          //     placeholderBuilder: OctoPlaceholder.blurHash(
          //       'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
          //     ),
          //     errorBuilder: OctoError.icon(
          //       color: Colors.grey,
          //     ),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Container(
              height: 120.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Obx(
                    () => Expanded(
                      child: IconButton(
                        icon: Icon(
                          controller.isFavourite.value
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                          color: controller.isFavourite.value
                              ? Colors.red
                              : ColorUtil.primaryColor,
                        ),
                        onPressed: controller.toggleFavourite,
                      ),
                    ),
                  ),
                  Container(
                    color: ColorUtil.secondaryColor,
                    width: 3.0,
                    height: double.infinity,
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.map,
                        color: ColorUtil.primaryColor,
                      ),
                      onPressed: controller.service.value.latitude == null ||
                              controller.service.value.longitude == null
                          ? () {}
                          : () async {
                              await AppUtil.openMapsSheet(
                                latitude: controller.service.value.latitude,
                                longitude: controller.service.value.latitude,
                              );
                            },
                    ),
                  ),
                  Container(
                    color: ColorUtil.secondaryColor,
                    width: 3.0,
                    height: double.infinity,
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.phoneAlt,
                        color: ColorUtil.primaryColor,
                      ),
                      onPressed: () async {
                        await AppUtil.callPhone(
                          phoneNumbers: [
                            if (controller.service.value.phone_1 != null)
                              controller.service.value.phone_1,
                            if (controller.service.value.phone_2 != null)
                              controller.service.value.phone_2,
                            if (controller.service.value.phone_3 != null)
                              controller.service.value.phone_3,
                            if (controller.service.value.mobile != null)
                              controller.service.value.mobile,
                          ],
                          context: context,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
