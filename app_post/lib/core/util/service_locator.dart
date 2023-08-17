import 'package:app_post/core/util/app_navigator.dart';
import 'package:app_post/core/util/service_locator.config.dart';
import 'package:app_post/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //initialize navigator
  AppNavigator();
  //initialize dependencies
  await getIt.init();
}
