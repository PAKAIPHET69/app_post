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
  Future<String> postComment(
      {required String postId,
      required String text,
      required String uid,
      required String name});
  Future<String> uploadImageToStorage(File imageFile);
  Stream<List<PostModel>> getUserPosts();
  Stream<List<PostCMModel>> getPostComments({required String pId});
  User getCurrentUser();
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
        .orderBy('datePublished', descending: true)
        .snapshots();
    Stream<List<PostModel>> userposts = snapshot.map((event) {
      return event.docs.map((e) => PostModel.fromJson(e.data())).toList();
    });
    return userposts;
  }

  /// Delete ///
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
      });
      return res;
    } on FirebaseException catch (e) {
      throw ServerException(e.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  /// Comment ///
  @override
  Future<String> postComment(
      {required String postId,
      required String text,
      required String uid,
      required String name}) async {
    String res = "Some error occurred";

    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        fireStore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'timestamp': DateTime.now(),
        });
        res = 'success';
      }
      return res;
    } on FirebaseException catch (e) {
      throw ServerException(e.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Stream<List<PostCMModel>> getPostComments({required String pId}) {
    final snapshot = fireStore
        .collection('posts')
        .doc(pId)
        .collection('comments')
        .orderBy('datePublished', descending: true)
        .snapshots();
    Stream<List<PostCMModel>> userposts = snapshot.map((event) {
      return event.docs.map((e) => PostCMModel.fromJson(e.data())).toList();
    });
    return userposts;
  }
}
