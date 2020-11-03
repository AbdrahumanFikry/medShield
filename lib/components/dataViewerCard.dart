import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/services/repositories/favourites/favourite.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:med_shield_new_version/utilities/pathUtil.dart';
import 'package:octo_image/octo_image.dart';

class DataViewerCard extends StatelessWidget {
  // final int id;
  // final String title;
  // final String subTitle;
  // final String imageUrl;
  final Favourite favourite;

  DataViewerCard({
    // this.id,
    // this.title,
    // this.subTitle,
    // this.imageUrl,
    this.favourite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.toNamed(
            Routes.SERVICE,
            arguments: favourite,
          ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Container(
            //   height: 200.w,
            //   width: 200.w,
            //   decoration: BoxDecoration(
            //     color: ColorUtil.greyColor,
            //     borderRadius: AppUtil.borderRadius,
            //   ),
            //   child: ClipRRect(
            //     borderRadius: AppUtil.borderRadius,
            //     child: OctoImage(
            //       image: CachedNetworkImageProvider(
            //         imageUrl ?? PathUtil.profileImagePlaceHolder,
            //       ),
            //       placeholderBuilder: OctoPlaceholder.blurHash(
            //         'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
            //       ),
            //       errorBuilder: OctoError.icon(
            //         color: Colors.red,
            //       ),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   width: 10.0,
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      favourite.name ?? '',
                      style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontSize: 38.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          size: 42.sp,
                          color: ColorUtil.greyColor,
                        ),
                        const SizedBox(
                          width: 7.5,
                        ),
                        Expanded(
                          child: Text(
                            favourite.description ?? '',
                            style: TextStyle(
                              color: ColorUtil.secondaryColor,
                              fontSize: 34.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 5.0,
                      color: ColorUtil.mediumGreyColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
