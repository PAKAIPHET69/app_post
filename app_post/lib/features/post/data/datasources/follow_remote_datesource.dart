import 'package:app_post/core/error/exceptions.dart';
import 'package:app_post/features/signin/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class FollowRemotDataSource {
  Future<void> saveFollowsUsers(
      {required String uid, required String followId});
  Stream<List<UserModel>> showFollows({required String uid});
}

@LazySingleton(as: FollowRemotDataSource)
class FollowRemotDataSourceImpl implements FollowRemotDataSource {
  final FirebaseFirestore fireStore;

  FollowRemotDataSourceImpl(
    this.fireStore,
  );

  @override
  Future<void> saveFollowsUsers(
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
      throw ServerException(e.message ?? '');
    }
  }

  @override
  Stream<List<UserModel>> showFollows({required String uid}) {
    final snapshots =
        fireStore.collection('users').where('uid', isEqualTo: uid).snapshots();
    final data = snapshots.map((event) {
      return event.docs.map((e) => UserModel.fromJson(e.data())).toList();
    });
    return data;
  }
}
