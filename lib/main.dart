import 'package:device_preview/device_preview.dart' as preview;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/services/appBinding.dart';
import 'package:med_shield_new_version/services/cacheService.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterDownloader.initialize(debug: false);
  CacheService.registerTypeAdapters();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    // preview.DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>
    MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: GetMaterialApp(
        title: 'MedShield',
        debugShowCheckedModeBanner: false,
        // locale: preview.DevicePreview.of(context).locale,
        // builder: preview.DevicePreview.appBuilder,
        theme: AppUtil.appTheme,
        getPages: AppPages.routes,
        initialRoute: Routes.SPLASH,
        initialBinding: InitBinding(),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
