import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/main/main_controller.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopAppBar extends StatefulWidget {
  final bool enableDrawer;
  final bool enableNotifications;
  final bool enableSearch;
  final bool shrink;

  TopAppBar({
    this.enableDrawer = false,
    this.enableNotifications = false,
    this.enableSearch = false,
    this.shrink = false,
  });

  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    MainController.to.barAnimationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    MainController.to.barAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorUtil.primaryColor,
      leading: widget.enableDrawer
          ? Padding(
        padding: EdgeInsets.only(
          top: 10.0,
          right: AppUtil.isLtr ? 13.0 : 7.0,
          left: AppUtil.isLtr ? 7.0 : 13.0,
        ),
        child: GestureDetector(
          onTap: MainController.to.handleListChanges,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_home,
            progress: MainController.to.barAnimationController,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      )
          : null,
      elevation: 0.5,
      actions: [
        widget.enableSearch
            ? Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.SEARCH),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        )
            : SizedBox.shrink(),
        widget.enableNotifications
            ? Padding(
          padding: EdgeInsets.only(
            right: AppUtil.isLtr ? 10.0 : 5.0,
            left: AppUtil.isLtr ? 5.0 : 10.0,
          ),
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        )
            : SizedBox.shrink(),
      ],
      title: FittedBox(
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Med',
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'Shield',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'MEDICAL SERVICES',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'AudioWide',
                fontSize: 26.sp,
              ),
            ),
          ],
        ),
      ),
      bottom: widget.shrink
          ? null
          : PreferredSize(
        preferredSize: Size(
          Get.width,
          40.0,
        ),
        child: Container(
          color: ColorUtil.primaryColor,
          height: 50,
          width: Get.width,
          child: Center(
            child: Obx(
                  () =>
                  Text(
                    MainController.to.isList.value
                        ? S
                        .of(context)
                        .more
                        : S
                        .of(context)
                        .approvalHistory,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 44.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
