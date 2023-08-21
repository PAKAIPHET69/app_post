// Import necessary packages
// ignore_for_file: prefer_const_constructors

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// local notifications
class LocalNotificationService {
  final FlutterLocalNotificationsPlugin notificationPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize local notifications
  Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings, iOS: null); // iOS
    await notificationPlugin.initialize(settings);
  }

  // Send a local notification
  Future<void> sendLocalNotification(String title, String body) async {
    final details = await _notificationDetails();
    await notificationPlugin.show(
        _generateNotificationId(), title, body, details);
  }

  // Configure notification details
  Future<NotificationDetails> _notificationDetails() async {
    //Android
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'description',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
    );
    // Initialize notification plugin and create notification channel
    final notificationPlugin = FlutterLocalNotificationsPlugin();
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'channel_id',
      'High Importance Notifications',
      description: 'Description of the channel',
      importance: Importance.high,
      playSound: true,
    );
    await notificationPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // iOS

    return NotificationDetails(
      android: androidNotificationDetails,
      iOS: null, // iOS details can be added here
    );
  }

  // Generate notification ID
  int _generateNotificationId() {
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return id;
  }
}
