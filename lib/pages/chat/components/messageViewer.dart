import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/pages/chat/components/imageViewer.dart';
import 'package:med_shield_new_version/pages/chat/components/pdfHandler.dart';
import 'package:med_shield_new_version/services/repositories/approvals/file.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class MessageViewer extends StatelessWidget {
  final int id;
  final String type;
  final List<FileDto> files;
  final String content;
  final String date;

  MessageViewer({
    this.id,
    this.content,
    this.type,
    this.files,
    this.date,
  });

  void _showImage(String image, int imageId) {
    Get.to(
      ImageViewer(
        image: image,
        id: imageId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment:
            type == 'me' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          files.length > 0 && files != null
              ? Container(
                  padding: EdgeInsets.all(
                    3.5,
                  ),
                  margin: EdgeInsets.only(
                    left: type == 'me' ? 30.0 : 0.0,
                    right: type == 'me' ? 0.0 : 30.0,
                  ),
                  decoration: BoxDecoration(
                    color: type == 'me'
                        ? ColorUtil.primaryColor
                        : ColorUtil.greyColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        10.0,
                      ),
                      bottomLeft: Radius.circular(
                        type == 'me' ? 10.0 : 0.0,
                      ),
                      topRight: Radius.circular(
                        10.0,
                      ),
                      bottomRight: Radius.circular(type == 'me' ? 0.0 : 10.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: type == 'me'
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        itemCount: files.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final file = files[index];
                          return file.fileLink.contains('pdf')
                              ? PdfHandler(
                                  file.fileLink,
                                  file.fileName,
                                  true,
                                )
                              : GestureDetector(
                                  onTap: () => _showImage(
                                    file.fileLink,
                                    file.id,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Hero(
                                      tag: file.id.toString(),
                                      child: Image.network(
                                        file.fileLink,
                                        height: 200,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                        },
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            margin: EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
              left: type == 'me' ? 30.0 : 0.0,
              right: type == 'me' ? 0.0 : 30.0,
            ),
            decoration: BoxDecoration(
              color:
                  type == 'me' ? ColorUtil.primaryColor : ColorUtil.greyColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  10.0,
                ),
                bottomLeft: Radius.circular(
                  type == 'me' ? 10.0 : 0.0,
                ),
                topRight: Radius.circular(
                  10.0,
                ),
                bottomRight: Radius.circular(type == 'me' ? 0.0 : 10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                content,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              5.0,
            ),
            child: Text(
              date ?? '',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
