import 'package:app_post/core/error/exceptions.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:injectable/injectable.dart';

abstract class FollowRemoteDatasoource {
  Future<void> followUser({required String uid, required String followId});
  User getCurrentUser();
}

@LazySingleton(as: FollowRemoteDatasoource)
class FollowDatasourceImpl implements FollowRemoteDatasoource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth auth;

  FollowDatasourceImpl(this.fireStore, this.auth);

  @override
  Future<void> followUser(
      {required String uid, required String followId}) async {
    try {
      DocumentSnapshot snapshot =
          await fireStore.collection('users').doc(uid).get();
      List following = (snapshot.data()! as dynamic)['following'];
      if (following.contains(followId)) {
        await fireStore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await fireStore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId]),
        });
      } else {
        await fireStore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await fireStore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } on FirebaseException catch (e) {
      throw ServerException(e.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  User getCurrentUser() {
    try {
      final userData = auth.currentUser;
      return User(
          uid: userData?.uid,
          displayName: userData?.displayName,
          email: userData?.email,
          followers: [],
          following: []);
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? '');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  getCountFollower({required String uid}) async {
    try {
      final count = await fireStore
          .collection('users')
          .doc(uid)
          .collection('followers')
          .count()
          .get();
      return count;
    } catch (e) {
      ServerException(e.toString());
    }
  }
}
