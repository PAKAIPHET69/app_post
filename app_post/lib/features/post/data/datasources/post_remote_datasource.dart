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
  Future<PostModel> postMosel();
  Future<void> savePost(PostModel postModel);
  Future<void> deletePost(String idPost);
  Future<void> updatePost(PostModel postModel);
  Future<String> uploadImageToStorage(File imageFile);
  Future<List<PostModel>> getUserPosts();
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
  /////////////////// Save Post to fireStore ////////////////////////////
  @override
  Future<PostModel> postMosel() async {
    final postId = Uuid().v1();
    PostModel postData = PostModel(
      pid: postId,
      datePublished: DateTime.now(),
    );
    return postData;
  }

  @override
  Future<void> savePost(PostModel postModel) async {
    // final postId = Uuid().v1();

    try {
      CollectionReference posts = fireStore.collection('posts');
      await posts.doc(postModel.pid).set(postModel.toJson());
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? '');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  ////////////// Uploads Photo to Storage ///////////////
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



  ///////////// Get UserPosts ////////////////
  @override
  Future<List<PostModel>> getUserPosts() async {
    try {
      QuerySnapshot snapshot = await fireStore
          .collection('posts')
          .orderBy('datePublished', descending: true)
          .get();
      List<PostModel> userposts = snapshot.docs.map((doc) {
        return PostModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      return userposts;
    } on FirebaseException catch (e) {
      throw ServerException(e.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  ///////////////// Delete ////////////
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

  ///////////////// Update Post ////////////
  @override
  Future<void> updatePost(PostModel postModel) async {
    try {
      final res = await fireStore
          .collection('posts')
          .doc(postModel.pid)
          // .set(postModel.toJson());
          .update({
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
}
