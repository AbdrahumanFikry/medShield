import 'package:bdaya_custom_splash/bdaya_custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/splash/components/body.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/services/cacheService.dart';
import 'package:med_shield_new_version/utilities/pathUtil.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentLang;
    return Builder(
      builder: (context) {
        return BdayaCustomSplash(
          splashDuration: 3,
          backgroundBuilder: (child) {
            return SplashBody(
              child: child,
            );
          },
          initFunction: () async {
            ScreenUtil.init(
              context,
              width: 750,
              height: 1334,
              allowFontScaling: true,
            );
            currentLang = await CacheService.to.initRepos();
            if (currentLang != null) await S.load(Locale(currentLang));
            await AppService.to.tryAutoLogin();
            AppService.to.sendPlatformToken();
            return AppService.to.isAuth;
          },
          logoBuilder: () {
            return Center(
              child: Image.asset(
                PathUtil.logoPath,
                width: 500.w,
              ),
            );
          },
          onNavigateTo: (result) async {
            if (result) {
              Get.toNamed(Routes.MAIN);
            } else if (currentLang != null) {
              Get.offNamed(Routes.AUTH);
            } else {
              Get.offNamed(Routes.SELECT_LANGUAGE);
            }
          },
        );
      },
    );
  }
}
