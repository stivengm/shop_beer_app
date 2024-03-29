import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalNotifications {

  static Future<void> requestPermissionLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
  }

  static Future<void> initializeLocalNotifications() async {
    
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

    // TODO: iOS Configuration

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      // TODO: iOS Configuration settings
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveBackgroundNotificationResponse: onDidReceiveBackgroundNotificationResponse
    );
  }

  static void showLocalNotifications({
    required  id,
    String? title,
    String? body,
    String? data
  }) {

    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.max
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      // TODO: iOS
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails, payload: data);

  }

}
