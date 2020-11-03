import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/AnimatedListHandler.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/main/components/drawerElement.dart';
import 'package:med_shield_new_version/pages/main/components/info.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/services/appService.dart';

class More extends StatelessWidget {
  final List<DrawerElement> items = [
    if (AppService.to.isAuth)
      DrawerElement(
        title: S.current.network,
        iconData: FontAwesomeIcons.battleNet,
        onTab: () => Get.toNamed(Routes.SEARCH),
      ),
    if (AppService.to.isAuth)
      DrawerElement(
        iconData: FontAwesomeIcons.heart,
        title: S.current.favourite,
        onTab: () => Get.toNamed(Routes.FAVORITES),
      ),
    DrawerElement(
      title: S.current.discountCard,
      iconData: FontAwesomeIcons.creditCard,
      onTab: () => Get.toNamed(Routes.DISCOUNT_CARD),
    ),
    DrawerElement(
      iconData: FontAwesomeIcons.cogs,
      title: S.current.settings,
      onTab: () => Get.toNamed(Routes.SETTINGS),
    ),
    DrawerElement(
      iconData: FontAwesomeIcons.info,
      title: S.current.aboutUs,
      onTab: () => Get.toNamed(Routes.ABOUT_US),
    ),
    AppService.to.isAuth
        ? DrawerElement(
            iconData: FontAwesomeIcons.signInAlt,
            title: S.current.signOut,
            onTab: () async => await AppService.to.logOut(),
          )
        : DrawerElement(
            iconData: FontAwesomeIcons.signInAlt,
            title: S.current.signIn,
            onTab: () => Get.offAllNamed(Routes.AUTH),
          )
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        children: <Widget>[
          if (AppService.to.isAuth) Info(),
          Expanded(
            child: AnimatedListHandler(
              children: items,
            ),
          ),
        ],
      ),
    );
  }
}
