import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

@module
abstract class InjectionModule {
  // injecting third party libraries
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  Dio get dio => Dio();

  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
  Logger get logger => Logger();

  //authentication
  GoogleSignIn get googleSignIn => GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );
  FirebaseAuth get auth => FirebaseAuth.instance;
  FacebookAuth get facebookAuth => FacebookAuth.instance;
  FirebaseFirestore get fireStore => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;
<<<<<<< HEAD
  FirebaseMessaging get messaging => FirebaseMessaging.instance;
  
=======
>>>>>>> parent of 8cc90f7 (save)
}
