import 'dart:convert';

import 'package:app_post/core/error/exceptions.dart';
import 'package:app_post/features/post/data/model/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

abstract class CommentRemoteDataSoure {
  // Save, Show, Count & Delete Comments
  Future<String> saveComment(
      {required String postId,
      required String text,
      required String uid,
      required String name,
      required String tokenID});
  Stream<List<CommentModel>> showComments({required String pId});
  Future<String> countComment({required String postId});
  Future<String> deleteComment(
      {required String postId, required String commentId});
}

@LazySingleton(as: CommentRemoteDataSoure)
class CommentRemoteDataSoureImpl implements CommentRemoteDataSoure {
  final FirebaseFirestore fireStore;

  CommentRemoteDataSoureImpl(
    this.fireStore,
  );

  /// Save Comment to firebase ///
  @override
  Future<String> saveComment({
    required String postId,
    required String text,
    required String uid,
    required String name,
    required String tokenID,
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
            'key=AAAAfO8o6Ns:APA91bEvfRQPJJEsffaVFYCuZNkcBPzO59TDJaCm_MJAPtpQ7unXtD-0E1RgzPYjIaBN1z6jMQ88FIOoD_3fNVFryPlXwscau1TvHj63M6Ks45VGi9hXMmrVJxzJ_dwu4UscLxngxnri',
        'Content-Type': 'application/json',
      };

      var request = http.Request(
          'POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));

      request.body = json.encode({
        "registration_ids": "$tokenID",
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

  @override
  Stream<List<CommentModel>> showComments({required String pId}) {
    final res = fireStore
        .collection('posts')
        .doc(pId)
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => CommentModel.fromJson(doc.data()))
            .toList());
    return res;
  }

  @override
  Future<String> countComment({required String postId}) async {
    try {
      final snap = await fireStore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .get();
      final res =
          snap.docs.map((e) => CommentModel.fromJson(e.data())).toList();
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
}
