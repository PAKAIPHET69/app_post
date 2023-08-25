// ignore_for_file: avoid_single_cascade_in_expression_statements, await_only_futures, depend_on_referenced_packages

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
  Future<void> savePost(
      {required String imageUrl,
      required String description,
      required String userId,
      required String userName,
      required List<String> listTokens});
  Future<void> updatePost(PostModel postModel);
  Future<String> uploadImageToStorage(File imageFile);
  // Show & Dalete Posts
  Stream<List<PostModel>> showPosts();
  Future<void> deletePost(String idPost);
  Future<String> saveLikesPost(
      {required String postId, required String uid, required String likes});
  Future<UserModel> getInfo({required String uid});
  Future<UserModel> getFollowerTokens();

  Future<void> logOut();
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

  @override
  Future<UserModel> getInfo({required String uid}) async {
    final res =
        await fireStore.collection('users').where('uid', isEqualTo: uid).get();
    final resulf = res.docs.map((e) => UserModel.fromJson(e.data())).toList();
    return resulf.first;
  }

  @override
  Future<UserModel> getFollowerTokens() async {
    final String uid = auth.currentUser?.uid ?? '';
    final res = await fireStore.collection('users').where(uid).get();
    final result = res.docs.map((e) => UserModel.fromJson(e.data())).toList();
    return result.first;
  }

  @override
  Future<void> logOut() async {
    await auth.signOut();
  }

  // Save Post to FireStore
  @override
  Future<void> savePost(
      {required String imageUrl,
      required String description,
      required String userId,
      required String userName,
      required List<String> listTokens}) async {
    try {
      // if (postModel.imageUrl!.isNotEmpty && postModel.description!.isEmpty) {
      //   return 'Some error occurred';}
      final postId = const Uuid().v1();
      final timestamp = DateTime.now();
      await fireStore
          .collection('posts')
          .doc(postId)
          .set({
        'description': description,
        'pid': postId,
        'imageUrl': imageUrl,
        'likes': [],
        'timestamp': timestamp.toIso8601String(),
        'userId': userId,
        'userName':userName,
      });
      // CollectionReference posts = await fireStore.collection('posts');
      // await posts.doc(pid).set(postModel.toJson());
      // final tokenId = [
      //   'd8BwsEDHRAyjbG_Ae1QuMP:APA91bEE51bFGA6YwAuJDY99D6NgULsd5xPr1yxC-1zauffp2Sgh541GymF6wv_8nKl7o__OBt8mV-Mb5-qUJYgdVZ03lPEz7t8VN_UZKeFdMdNqVeNhJSBlDy9Xd6gQ_Ujg4LO2H8tE'
      // ];
      // final listTokens = postModel.listTokens;
      // print(listTokens);
      // final tokenId = [listTokens];
      var headers = {
        'Authorization':
            'key=AAAAfO8o6Ns:APA91bEvfRQPJJEsffaVFYCuZNkcBPzO59TDJaCm_MJAPtpQ7unXtD-0E1RgzPYjIaBN1z6jMQ88FIOoD_3fNVFryPlXwscau1TvHj63M6Ks45VGi9hXMmrVJxzJ_dwu4UscLxngxnri',
        'Content-Type': 'application/json',
      };

      var request = http.Request(
          'POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));

      request.body = json.encode({
        "registration_ids": [listTokens],
        "notification": {
          "title": "$userName New Post!",
          "body": "$description",
          "image": "$imageUrl",
          "content_available": true,
          "priority": "high",
        },
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
      // return 'success';
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? '');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
