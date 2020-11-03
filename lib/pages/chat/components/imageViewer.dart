import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/loading.dart';
import 'package:med_shield_new_version/pages/chat/chat_controller.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';

class ImageViewer extends StatelessWidget {
  final String image;
  final int id;

  ImageViewer({
    @required this.image,
    @required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorUtil.primaryColor,
              size: 55.sp,
            ),
            onPressed: () => Get.back(result: true),
          ),
          actions: [
            IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowAltCircleDown,
                color: Colors.black,
              ),
              onPressed: () async =>
                  await ChatController.to.downloadFile(image, basename(image)),
            )
          ],
        ),
        body: image == null
            ? Loading()
            : Center(
                child: Hero(
                  tag: id.toString(),
                  child: Image.network(
                    image,
                  ),
                ),
              ),
      ),
    );
  }
}
