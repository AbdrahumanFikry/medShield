import 'package:flutter/material.dart';

class ColorUtil {
  static const primaryColor = Color(0xff0C2471);
  static Color hintColor = Colors.grey[300];
  static Color lightGreyColor = Colors.grey[200];
  static Color mediumGreyColor = Colors.grey[400];
  static Color greyColor = Colors.grey[600];
  static Color errorColor = Colors.red[900];
  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.7),
      spreadRadius: 0.5,
      blurRadius: 0.5,
      offset: Offset(
        0,
        0.5,
      ),
    ),
  ];
  static Color secondaryColor = Color(0xff0C2471).withOpacity(0.3);
  static const primaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(12, 36, 113, 1),
      Color.fromRGBO(12, 36, 113, .1),
    ],
  );
}
