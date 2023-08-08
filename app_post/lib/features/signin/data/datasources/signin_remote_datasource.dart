import 'package:app_post/features/signin/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';

abstract class SignInDatasource {
  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithFacebook();
  Future<void> logOutAuth();
  Future<void> saveUser(UserModel userModel);
}

@LazySingleton(as: SignInDatasource)
class SignInRemoteDatasource implements SignInDatasource {
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  final FirebaseAuth _auth;
  final FirebaseFirestore _fireStore;

  SignInRemoteDatasource(
      this._googleSignIn, this._facebookAuth, this._auth, this._fireStore);

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      UserModel userModel = UserModel(
        uid: userCredential.user?.uid,
        displayName: userCredential.user?.displayName,
        email: userCredential.user?.email,
        followers: [],
        following: [],
      );
      return userModel;
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? '');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> saveUser(UserModel userModel) async {
    try {
      CollectionReference users = _fireStore.collection('users');
      await users.doc(userModel.uid).set(userModel.toJson());
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? '');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signInWithFacebook() async {
    try {
      final facebookUser = await _facebookAuth.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(facebookUser.accessToken!.token);
      UserCredential userCredential =
          await _auth.signInWithCredential(facebookAuthCredential);
      UserModel userModel = UserModel(
        uid: userCredential.user?.uid,
        displayName: userCredential.user?.displayName,
        email: userCredential.user?.email,
      );
      return userModel;
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? '');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> logOutAuth() async {
    try {
      FirebaseAuth.instance.signOut;
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? '');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
