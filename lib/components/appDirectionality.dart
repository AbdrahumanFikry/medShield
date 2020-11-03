import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as L;

class AppDirectionality extends StatelessWidget {
  final Widget child;

  AppDirectionality({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: L.Intl.getCurrentLocale() == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: child,
    );
  }
}
