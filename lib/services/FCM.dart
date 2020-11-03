import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/pages/chat/chat_controller.dart';
import 'package:med_shield_new_version/pages/main/main_controller.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:flutter/material.dart';
import 'package:med_shield_new_version/services/cacheService.dart';
import 'package:med_shield_new_version/services/repositories/approvals/approval-repository.dart';

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
    print('data from background $data');
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
    print('notification from background $notification');
  }

  // Or do other work.
}

class FirebaseNotifications extends GetxService {
  FirebaseMessaging _firebaseMessaging;
  Future Function(Map<String, dynamic>) onLaunch;
  Future Function(Map<String, dynamic>) onResume;
  Future Function(Map<String, dynamic>) onMessage;
  Function getTokenCallback;

  FirebaseNotifications() : _firebaseMessaging = FirebaseMessaging();

  void setHandlers(
      Function(Map<String, dynamic>) onMessage,
      Function(Map<String, dynamic>) onLaunch,
      Function(Map<String, dynamic>) onResume) {
    this.onLaunch = onLaunch;
    this.onMessage = onMessage;
    this.onResume = onResume;
    firebaseCloudMessagingListeners();
  }

  void setGetTokenCallback(void Function(String token) getTokenCallback) {
    if (Platform.isIOS) iOSPermission();
    _firebaseMessaging.getToken().then((token) async {
      getTokenCallback(token);
      AppService.to.fireBaseToken.value = token;
    });
  }

  void firebaseCloudMessagingListeners() {
    _firebaseMessaging.configure(
      onBackgroundMessage: myBackgroundMessageHandler,
      onMessage: onMessage,
      onResume: onResume,
      onLaunch: onLaunch,
    );
  }

  void iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  static Future<void> navigateToItemDetail(LiveNotificationItem item) async {
    switch (item.type) {
      case TYPE_APPROVAL_COMMENT:
        print('Navigating to Details:');
        Get.offNamed(
          Routes.CHAT,
          arguments: int.tryParse(item.id),
        );
        break;
      default:
        break;
    }
  }
}

const String TYPE_APPROVAL_COMMENT = 'approval_comment';

class LiveNotificationItem {
  final String notificationTitle;
  final String notificationBody;
  final String id;
  final String type;
  final String sound;
  final DateTime date;

/*
{
  notification: {
    title: You Have new comment,
    body: Hi mobile
  },
  data: {
    id: 157,
    body: Hi mobile,
    type: approval_comment,
    sound: default,
    title: You Have new comment
  }
}
 */

  LiveNotificationItem({
    @required this.notificationTitle,
    @required this.notificationBody,
    @required this.id,
    @required this.type,
    @required this.sound,
    @required this.date,
  });

  factory LiveNotificationItem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    print('Parsing Live Notification: $map');
    try {
      final Map<dynamic, dynamic> notification = map['notification'];
      final Map<dynamic, dynamic> data = map['data'] ?? map;
      return LiveNotificationItem(
        notificationTitle: notification['title'],
        notificationBody: notification['body'],
        id: data['id'],
        type: data['type'],
        sound: data['sound'],
        date: DateTime.now(),
      );
    } catch (e) {
      print('Error when parsing notification:\n$e');
      rethrow;
    }
  }
}
