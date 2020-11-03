import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_shield_new_version/components/appButton.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtil {
  static final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static BorderRadius borderRadius = BorderRadius.circular(10.0);
  static Border border = Border.all(
    color: ColorUtil.mediumGreyColor,
  );
  static OutlineInputBorder lightGreyOutLineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorUtil.mediumGreyColor,
      width: 0.5,
    ),
    borderRadius: AppUtil.borderRadius,
  );
  static ThemeData appTheme = ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static bool get isLtr => Intl.getCurrentLocale() == 'en';
  static BorderRadius customBorderRadius = isLtr
      ? BorderRadius.only(
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        )
      : BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
        );

  static Future chooseDateTime({
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.dateAndTime,
  }) async {
    DateTime result = DateTime.now();
    return await Get.bottomSheet<DateTime>(
      Container(
        height: 500.h,
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: CupertinoDatePicker(
                onDateTimeChanged: (DateTime value) {
                  result = value;
                },
                minimumYear: 1900,
                maximumYear: 2500,
                initialDateTime: DateTime.now(),
                mode: mode,
              ),
            ),
            AppButton(
              height: 45.0,
              title: S.current.done,
              onPressed: () => Get.back(result: result),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  static Future<Position> getLocation() async {
    try {
      LocationPermission permission = await checkPermission();
      if (permission == LocationPermission.denied) {
        await requestPermission();
      }
      final geo = GeolocatorPlatform.instance;
      Position position = await geo.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print(
        'UserLocation => \nlat : ' +
            position.latitude.toString() +
            '\nlong : ' +
            position.longitude.toString(),
      );
      return position;
    } catch (e) {
      print('Geolocator Error : ' + e.toString());
      return Position();
    }
  }

  static void showAlertSnack({
    String title,
    String body,
  }) {
    Get.snackbar(
      title,
      body,
      backgroundColor: Colors.white,
      titleText: Text(
        title,
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
        ),
      ),
      messageText: Text(
        body,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
        ),
      ),
      icon: Icon(
        Icons.error_outline,
        color: Colors.red,
      ),
    );
  }

  static Future openMapsSheet({
    double latitude,
    double longitude,
  }) async {
    try {
      final url =
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
      if (await canLaunch(url)) {
        await launch(url);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> callPhone({
    List<String> phoneNumbers,
    BuildContext context,
  }) async {
    if (Platform.isIOS) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            actions: <Widget>[
              ...phoneNumbers.map((e) {
                final url = 'tel://$e';
                return CupertinoActionSheetAction(
                  child: Text(
                    e,
                    style: TextStyle(
                      color: ColorUtil.primaryColor,
                    ),
                  ),
                  onPressed: () async {
                    try {
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                );
              }).toList(),
            ],
            cancelButton: CupertinoActionSheetAction(
              isDefaultAction: true,
              child: Text(
                S.current.cancel,
              ),
              onPressed: () {
                Get.back(result: true);
              },
            ),
          );
        },
      );
    } else {
      await Get.bottomSheet(
        Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
            ),
          ),
          child: ListView.builder(
            itemCount: phoneNumbers.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final url = 'tel://${phoneNumbers[index]}';
              return ListTile(
                title: Text(
                  phoneNumbers[index],
                  style: TextStyle(
                    color: ColorUtil.primaryColor,
                  ),
                ),
                onTap: () async {
                  try {
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
              );
            },
          ),
        ),
      );
    }
  }

  static Future<T> showAlertDialog<T>({
    String title,
    String body,
    Function onConfirm,
    String confirmText,
    bool enableCancel = false,
  }) async {
    return await Get.defaultDialog<T>(
      title: S.current.alert,
      content: Text(
        body,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
      titleStyle: TextStyle(
        color: ColorUtil.errorColor,
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
      ),
      confirm: Obx(
        () => AppService.to.loading.value
            ? SizedBox.shrink()
            : InkWell(
                onTap: onConfirm ?? () => Get.back(result: true),
                child: Text(
                  confirmText ?? S.current.done,
                  style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
              ),
      ),
      cancel: enableCancel
          ? InkWell(
              onTap: () => Get.back(result: true),
              child: Text(
                S.current.cancel,
                style: TextStyle(
                  color: ColorUtil.errorColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            )
          : null,
    );
  }
}
