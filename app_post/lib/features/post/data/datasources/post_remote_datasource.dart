// ignore_for_file: avoid_single_cascade_in_expression_statements, await_only_futures

import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/exceptions.dart';
import '../../../signin/domain/entity/user.dart';
import '../model/post_model.dart';

abstract class PostRemoteDatasource {
  Future<void> savePost(PostModel postModel);
  Future<void> deletePost(String idPost);
  Future<void> updatePost(PostModel postModel);
  Future<String> getViewCm({required String postId});
  Future<String> uploadImageToStorage(File imageFile);
  Stream<List<PostModel>> getUserPosts();
  Stream<List<PostCMModel>> getPostComments({required String pId});
  User getCurrentUser();

  Future<String> likesPost({
    required String postId,
    required String uid,
    required String likes,
  });

  Future<String> postComment({
    required String postId,
    required String text,
    required String uid,
    required String name,
  });

  Future<String> deletePostCM({
    required String postId,
    required String commentId,
  });
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

  /// Save Post to fireStore ///
  @override
  Future<void> savePost(PostModel postModel) async {
    try {
      CollectionReference posts = fireStore.collection('posts');
      await posts.doc(postModel.pid).set(postModel.toJson());
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? '');
    } catch (e) {
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

  /// Get UserPosts ///
  @override
  Stream<List<PostModel>> getUserPosts() {
    final snapshot = fireStore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .snapshots();
    Stream<List<PostModel>> userposts = snapshot.map((event) {
      return event.docs.map((e) => PostModel.fromJson(e.data())).toList();
    });
    return userposts;
  }

  /// Delete Post ///
  @override
  Future<void> deletePost(String idPost) async {
    try {
      final res = await fireStore.collection('posts').doc(idPost).delete();
      return res;
    } on FirebaseException catch (e) {
      throw ServerException(e.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  /// Update Post ///
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
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  /// Save Comment to firebase ///
  @override
  Future<String> postComment({
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

      return 'success';
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  /// Post Comment
  @override
  Stream<List<PostCMModel>> getPostComments({required String pId}) {
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
  Future<String> deletePostCM(
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
  Future<String> getViewCm({required String postId}) async {
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

  /// Likes
  @override
  Future<String> likesPost({
    required String postId,
    required String uid,
    required String likes,
  }) async {
    String res = "Some error occurred";
    try {
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
}
