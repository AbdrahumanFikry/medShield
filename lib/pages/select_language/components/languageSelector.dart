import 'package:flutter/material.dart';
import 'package:med_shield_new_version/utilities/pathUtil.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageSelector extends StatelessWidget {
  final String title;
  final String imagePath;
  final Function onSelect;

  LanguageSelector({
    this.title = 'New language',
    this.imagePath = PathUtil.appIconPath,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onSelect,
          child: SizedBox(
            width: 300.w,
            child: ClipPolygon(
              sides: 6,
              borderRadius: 5.0,
              child: Container(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                ),
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 50.h,
            bottom: 100.h,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 36.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
