import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:med_shield_new_version/utilities/pathUtil.dart';
import 'package:octo_image/octo_image.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final String imagePath;

  CustomSliverDelegate({
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
    this.imagePath,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        final imgDimension = constraints.maxWidth / 3;
        final centerScreenWidth = constraints.maxWidth / 2;
        final offset = max(minExtent, maxExtent - shrinkOffset);
        final offsetPercent = (offset - minExtent) / (maxExtent - minExtent);
        final double rightAtMaxOffset = centerScreenWidth - (imgDimension / 2);
        final double rightAtMinOffset = 10;

        final double bottomAtMaxOffset = 0;
        final double bottomAtMinOffset = 10;

        final double dimensionAtMaxOffset = imgDimension;
        final double dimensionAtMinOffset = minExtent / 1.5;

        final double bgHeightAtMaxOffset = maxExtent - (imgDimension / 2);
        final double bgHeightAtMinOffset = minExtent;

        final double currentBottom =
            offsetPercent * (bottomAtMaxOffset - bottomAtMinOffset) +
                bottomAtMinOffset;
        final double curRight =
            offsetPercent * (rightAtMaxOffset - rightAtMinOffset) +
                rightAtMinOffset;
        final double curDimension =
            offsetPercent * (dimensionAtMaxOffset - dimensionAtMinOffset) +
                dimensionAtMinOffset;

        final double curBgHeight =
            offsetPercent * (bgHeightAtMaxOffset - bgHeightAtMinOffset) +
                bgHeightAtMinOffset;
        return SizedBox(
          height: max(minExtent, offsetPercent * maxExtent),
          child: Stack(
            children: [
              AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              PositionedDirectional(
                bottom: currentBottom,
                end: curRight,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: curDimension / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45.0),
                    child: Hero(
                      tag: 'Profile',
                      child: OctoImage(
                        width: curDimension * 0.87,
                        height: curDimension * 0.87,
                        image: CachedNetworkImageProvider(
                          imagePath ?? PathUtil.profileImagePlaceHolder,
                        ),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                        ),
                        errorBuilder: OctoError.icon(
                          color: Colors.red,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 25;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
