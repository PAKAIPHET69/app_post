// ignore_for_file: prefer_const_constructors

import 'package:app_post/core/service/service_local_notification.dart';
import 'package:app_post/core/util/app_navigator.dart';
import 'package:app_post/core/util/route.dart';
import 'package:app_post/core/util/service_locator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await configureDependencies();
  // Initialize local notification
  final localNotificationService = LocalNotificationService();
  await localNotificationService.initialize();

// Configure Firebase Messaging
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: AppRoute.signinRoute,
    );
  }
}
