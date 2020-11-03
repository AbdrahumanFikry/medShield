import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/pages/profile/profile_controller.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:med_shield_new_version/utilities/pathUtil.dart';
import 'package:octo_image/octo_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageHandler extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 130.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45.0),
                  child: Obx(
                    () => controller.profileImage.value != null
                        ? Image.file(
                            controller.profileImage.value,
                            fit: BoxFit.cover,
                            width: 235.w,
                            height: 235.w,
                          )
                        : Hero(
                            tag: 'Profile',
                            child: OctoImage(
                              width: 235.w,
                              height: 235.w,
                              image: CachedNetworkImageProvider(
                                AppService.to.user?.value?.image ??
                                    PathUtil.profileImagePlaceHolder,
                              ),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                              ),
                              errorBuilder: OctoError.icon(
                                color: Colors.grey,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: ColorUtil.lightGreyColor.withOpacity(0.3),
                radius: 130.w,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.cameraRetro,
                      color: Colors.black,
                      size: 50.sp,
                    ),
                    onPressed: () => controller.changeProfileImage(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
