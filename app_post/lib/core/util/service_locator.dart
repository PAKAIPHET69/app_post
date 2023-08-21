import 'package:app_post/core/service/service_local_notification.dart';
import 'package:app_post/core/util/app_navigator.dart';
import 'package:app_post/core/util/route.dart';
import 'package:app_post/core/util/service_locator.config.dart';
import 'package:app_post/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize navigator
  AppNavigator();
  //initialize dependencies
  await getIt.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Firebase messaging
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  final NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.instance.getInitialMessage().then(
    (message) {
      print("Initialize Message ${message.toString()}");
    },
  );

  // Listen for foreground messages and show local notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final localNotificationService = LocalNotificationService();
    localNotificationService.sendLocalNotification(
      message.notification?.title ?? 'Notification Title',
      message.notification?.body ?? 'Notification Body',
    );
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('you got a new message, click to open the app');
    print(message.data.toString());

    final String? route = message.data['route'];
    if (route != null) {
      AppNavigator.navigateTo(AppRoute.nvbRoute);
    }
  });
}
