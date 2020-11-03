import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/appTopBar.dart';
import 'package:med_shield_new_version/pages/main/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          // drawer: AppDrawer(),
          appBar: PreferredSize(
            preferredSize: Size(
              Get.width,
              100.0,
            ),
            child: TopAppBar(
              enableDrawer: true,
              enableNotifications: true,
              enableSearch: true,
            ),
          ),
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowGlow();
              return true;
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  child: child,
                  opacity: animation,
                );
              },
              child: Obx(
                () => controller.targetBody.value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
