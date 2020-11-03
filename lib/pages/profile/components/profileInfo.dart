import 'package:flutter/material.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  ProfileInfo({
    this.icon,
    this.title = '',
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return content?.isNotEmpty == true
        ? Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 15.0,
            ),
            child: Row(
              children: <Widget>[
                Card(
                  shape: CircleBorder(),
                  elevation: 8.0,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.indigo,
                    child: Icon(icon),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        color: ColorUtil.greyColor,
                        fontSize: 28.sp,
                      ),
                    ),
                    SizedBox(
                      width: 400.w,
                      child: Text(
                        content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 34.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        : SizedBox.shrink();
  }
}
