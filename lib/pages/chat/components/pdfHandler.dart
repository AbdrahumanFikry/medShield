import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_shield_new_version/pages/chat/chat_controller.dart';

class PdfHandler extends GetView<ChatController> {
  final String url;
  final String fileName;
  final bool isMe;

  PdfHandler(
    this.url,
    this.fileName,
    this.isMe,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.w,
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 8.0,
            ),
            child: InkWell(
              onTap: () {
                if (url != null) controller.downloadFile(url, fileName);
              },
              child: Stack(children: <Widget>[
                Container(
                  width: 250.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.filePdf,
                        color: Colors.white,
                        size: 100,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              fileName,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // data.task.status == DownloadTaskStatus.running ||
                //         data.task.status == DownloadTaskStatus.paused
                //     ? Obx(
                //         () => Positioned(
                //           left: 0.0,
                //           right: 0.0,
                //           bottom: 0.0,
                //           child: LinearProgressIndicator(
                //             value: data.task.progress / 100,
                //           ),
                //         ),
                //       )
                //     : Container()
              ]),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
