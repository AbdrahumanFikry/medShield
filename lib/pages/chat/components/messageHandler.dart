import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/pages/chat/chat_controller.dart';
import 'package:med_shield_new_version/pages/chat/components/filesViewer.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class MessageHandler extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilesViewer(),
        Container(
          height: 70,
          width: double.infinity,
          color: Colors.white.withOpacity(
            0.5,
          ),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () async => await controller.uploadImages(),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15.0,
                    right: 7.5,
                  ),
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: ColorUtil.primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.messageController,
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    hintText: 'Type a message',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) => controller.messageText.value = value,
                  cursorColor: Colors.indigo,
                  cursorWidth: 2.5,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Obx(
                () => GestureDetector(
                  onTap: () async {
                    await controller.onSend();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 7.5,
                      right: 15.0,
                    ),
                    child: Icon(
                      controller.sendingText.value
                          ? FontAwesomeIcons.spinner
                          : controller.messageText.value.isEmpty &&
                                  controller.toUpload.isEmpty
                              ? FontAwesomeIcons.paperPlane
                              : FontAwesomeIcons.solidPaperPlane,
                      color: ColorUtil.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
