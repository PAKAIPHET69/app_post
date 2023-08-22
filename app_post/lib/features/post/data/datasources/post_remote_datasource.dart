// ignore_for_file: avoid_single_cascade_in_expression_statements, await_only_futures

import 'dart:convert';
import 'dart:io';
import 'package:app_post/features/signin/data/model/user_model.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/exceptions.dart';
import '../../../signin/domain/entity/user.dart';
import '../model/post_model.dart';

abstract class PostRemoteDatasource {
  User getCurrentUser();
  // save & updata Posts
  Future<void> savePost(PostModel postModel);
  Future<void> updatePost(PostModel postModel);
  Future<String> uploadImageToStorage(File imageFile);
  // Show & Dalete Posts
  Stream<List<PostModel>> showPosts();
  Future<void> deletePost(String idPost);
  Future<String> saveLikesPost(
      {required String postId, required String uid, required String likes});
  // Save, Show, Count & Delete Comments
  Future<String> saveComment(
      {required String postId,
      required String text,
      required String uid,
      required String name});
  Stream<List<PostCMModel>> showComments({required String pId});
  Future<String> countComment({required String postId});
  Future<String> deleteComment(
      {required String postId, required String commentId});
  // Save FollowsUsers
  Future<void> saveFollowsUsers(
      {required String uid, required String followId});
  Future<List<UserModel>> getFollow({required String uid});
}

@LazySingleton(as: PostRemoteDatasource)
class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth auth;
  final FirebaseStorage storage;

  PostRemoteDatasourceImpl(
    this.fireStore,
    this.auth,
    this.storage,
  );
  // Get CurrentUsers
  @override
  User getCurrentUser() {
    try {
      final userData = auth.currentUser;
      return User(
        uid: userData?.uid,
        displayName: userData?.displayName,
        email: userData?.email,
      );
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? '');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // Save Post to FireStore
  @override
  Future<void> savePost(PostModel postModel) async {
    try {
      // if (postModel.imageUrl!.isNotEmpty && postModel.description!.isEmpty) {
      //   return 'Some error occurred';
      // }
      CollectionReference posts = fireStore.collection('posts');
      await posts.doc(postModel.pid).set(postModel.toJson());
      // return 'success';
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? '');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // Update Posts
  @override
  Future<void> updatePost(PostModel postModel) async {
    try {
      final res =
          await fireStore.collection('posts').doc(postModel.pid).update({
        'description': postModel.description,
        'imageUrl': postModel.imageUrl,
        'timestamp': DateTime.now().toIso8601String(),
      });
      return res;
    } on FirebaseException catch (e) {
      throw ServerException(e.toString());
    }
  }

  /// Uploads Photo to Storage ///
  @override
  Future<String> uploadImageToStorage(File imageFile) async {
    String basename = path.basename(imageFile.path);
    try {
      Reference storageRef = storage.ref("posts").child(basename);
      final uploadTask = await storageRef.putFile(imageFile);
      final String imageUrl = await uploadTask.ref.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? '');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // Show Posts
  @override
  Stream<List<PostModel>> showPosts() {
    final snapshot = fireStore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .snapshots();
    Stream<List<PostModel>> userposts = snapshot.map((event) {
      return event.docs.map((e) => PostModel.fromJson(e.data())).toList();
    });
    return userposts;
  }

  // Delete Post
  @override
  Future<void> deletePost(String idPost) async {
    try {
      final res = await fireStore.collection('posts').doc(idPost).delete();
      return res;
    } on FirebaseException catch (e) {
      throw ServerException(e.toString());
    }
  }

  // Likes 
  @override
  Future<String> saveLikesPost({
    required String postId,
    required String uid,
    required String likes,
  }) async {
    String res = "Some error occurred";
    try {
      DocumentSnapshot snapshot =
          await fireStore.collection('posts').doc(postId).get();
      List likes = (snapshot.data()! as dynamic)['likes'];
      if (likes.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        fireStore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        fireStore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
      res = 'success';
    } catch (e) {
      throw ServerException(e.toString());
    }
    return res;
  }

  // get user follow
  @override
  Future<List<UserModel>> getFollow({required String uid}) async {
    try {
      final snaps = await fireStore
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get();
      final res =
          snaps.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
      return res;
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? '');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  /// Post Comment
  @override
  Stream<List<PostCMModel>> showComments({required String pId}) {
    final res = fireStore
        .collection('posts')
        .doc(pId)
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PostCMModel.fromJson(doc.data()))
            .toList());
    return res;
  }

  /// Delete Comment
  @override
  Future<String> deleteComment(
      {required String postId, required String commentId}) async {
    try {
      await fireStore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .delete();
      return 'success';
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> countComment({required String postId}) async {
    try {
      final snap = await fireStore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .get();
      final res = snap.docs.map((e) => PostCMModel.fromJson(e.data())).toList();
      final countCM = res.length.toString();
      if (countCM.isEmpty) {
        return '0';
      } else {
        return countCM;
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // Follow
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
      throw ServerException(e.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  /// Save Comment to firebase ///
  @override
  Future<String> saveComment({
    required String postId,
    required String text,
    required String uid,
    required String name,
  }) async {
    try {
      if (text.isEmpty) {
        return 'Some error occurred';
      }
      final commentId = const Uuid().v1();
      final timestamp = DateTime.now();
      await fireStore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .set({
        'name': name,
        'uid': uid,
        'text': text,
        'commentId': commentId,
        'timestamp': timestamp.toIso8601String(),
      });

      var headers = {
        'Authorization':
            'key=AAAAQyDf7is:AAAAfO8o6Ns:APA91bEvfRQPJJEsffaVFYCuZNkcBPzO59TDJaCm_MJAPtpQ7unXtD-0E1RgzPYjIaBN1z6jMQ88FIOoD_3fNVFryPlXwscau1TvHj63M6Ks45VGi9hXMmrVJxzJ_dwu4UscLxngxnri--Zq5cHgCTojGqiSJJ2gz',
        'Content-Type': 'application/json',
      };

      var request = http.Request(
          'POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));

      request.body = json.encode({
        "registration_ids":
            'c8rHIO40TSKPDmUT4ZTv8z:APA91bFXsFJqb_kPTsXssPWnaPU099O2uv5RqFcni62vBGRG-qWboULeyEOSrX2METnWHTwtPLR8Rreq8jPxAtKesOryQqbnHO4JtkVJQfbr0q13zqrHtF4PHhP86iTloV-w9SZjBdls',
        "notification": {
          "body": "$text",
          "content_available": true,
          "priority": "high",
          "title": "$name",
        },
        // "data": {"payload": ""}
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }

      return 'success';
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
