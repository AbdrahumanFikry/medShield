import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/loading.dart';
import 'package:med_shield_new_version/components/plainAppBar.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/chat/chat_controller.dart';
import 'package:med_shield_new_version/pages/chat/components/approvalData.dart';
import 'package:med_shield_new_version/pages/chat/components/messageHandler.dart';
import 'package:med_shield_new_version/pages/chat/components/messageViewer.dart';
import 'package:med_shield_new_version/services/appService.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          appBar: PlainAppBar(
            barTitle: S.of(context).chat,
            enableBack: true,
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Obx(() {
                        if (AppService.to.loading.value) {
                          return Loading();
                        } else {
                          return NotificationListener<
                              OverscrollIndicatorNotification>(
                            onNotification: (overScroll) {
                              overScroll.disallowGlow();
                              return true;
                            },
                            child: ListView(
                              reverse: true,
                              padding: EdgeInsets.only(
                                top: 8.0,
                                right: 8.0,
                                left: 8.0,
                              ),
                              children: [
                                SizedBox(
                                  height: 65.0,
                                ),
                                ...controller
                                    .approvalCached.value.approval_comments
                                    .map(
                                      (e) => MessageViewer(
                                        id: e.id,
                                        files: e.files,
                                        content: e.comment,
                                        type: e.replay_with,
                                      ),
                                    )
                                    .toList()
                                    .reversed,
                                ApprovalData(
                                  id: controller.approvalId.toString(),
                                  name: 'me',
                                  title: controller.approvalCached.value.title,
                                  addDate:
                                      controller.approvalCached.value.add_date,
                                  companyName: controller
                                      .approvalCached.value.company_name,
                                  files: controller.approvalCached.value.files
                                      .toList(),
                                ),
                              ],
                            ),
                          );
                        }
                      }),
                    ),
                    MessageHandler(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
