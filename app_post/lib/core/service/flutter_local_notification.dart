// import 'package:chatchat/core/error/exceptions.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class LocalNotificationService {
//   LocalNotificationService();

//   final FlutterLocalNotificationsPlugin notificationPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> initialize() async {
//     const AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings('@mipmap-hdpi/ic_launcher.png');
//     final DarwinInitializationSettings iOSInitializationSettings =
//         DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );

//     final InitializationSettings settings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iOSInitializationSettings,
//     );
//     await notificationPlugin.initialize(settings);
//   }

//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) {
//     print('id $id');
//   }

//   Future<NotificationDetails> notificationDetails() async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       channelDescription: 'description',
//       importance: Importance.high,
//       priority: Priority.high,
//       playSound: true,
//     );

//     const DarwinNotificationDetails iOSNotificationDetails =
//         DarwinNotificationDetails();

//     return const NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: iOSNotificationDetails,
//     );
//   }

//   Future<void> showLocalNotification({
//     required int id,
//     required String title,
//     required String body,
//   }) async {
//     try {
//       final details = await notificationDetails();
//       await notificationPlugin.show(
//         id,
//         title,
//         body,
//         details,
//       );
//     } catch (e) {
//       throw ServerException(e.toString());
//     }
//   }

//   Future<void> configureLocalNotifications() async {
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'channel_id',
//       'High Importance Notifications',
//       description: 'description',
//       importance: Importance.high,
//       playSound: true,
//     );

//     await notificationPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//   }

//   Future<void> configureFirebaseMessaging() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     final FirebaseMessaging messaging = FirebaseMessaging.instance;
//     final NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     print('User granted permission: ${settings.authorizationStatus}');

//     FirebaseMessaging.instance.getInitialMessage().then(
//       (message) {
//         print("Initialize Message ${message.toString()}");
//       },
//     );
//   }

//   Future<void> setupNotifications() async {
//     await initialize();
//     await configureLocalNotifications();
//     await configureFirebaseMessaging();
//   }
// }
