import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationChannal {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    InitializationSettings initializationSettings =
        const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );
    _notificationsPlugin.initialize(initializationSettings);
  }

  static void send(RemoteMessage message) async {
    final iD = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    try {
      NotificationDetails notificationDetails = const NotificationDetails(
          android: AndroidNotificationDetails(
        'flutter_fcm',
        'flutter_fcm channal',
        importance: Importance.max,
        priority: Priority.max,
      ));
      log(iD.toString());
      await _notificationsPlugin.show(
        iD,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
      );
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
