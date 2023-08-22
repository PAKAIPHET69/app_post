import 'dart:io';

import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/domain/entity/post_cm.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../signin/domain/entity/user.dart';

abstract class Repository {
  User getCurrentUser();

  Future<Either<Failure, void>> postUsecase(Post post);
  Future<Either<Failure, void>> deletePostUsecase(String pid);
  Future<Either<Failure, void>> updatePostUsecase(Post post);

  Future<Either<Failure, String>> uploadImageUsecase(File imageFile);
  Stream<List<Post>> showPostUsecase();
  Stream<List<PostCM>> showCommentsUsecase({required String pId});

  Future<List<User>> showFollow({required String uid});
  Stream<List<User>> showFollows({required String uid});
  Future<Either<Failure, void>> followUsecase(
      {required String followId, required String uid});

  Future<String> likePost({
    required String postId,
    required String uid,
    required String likes,
  });

  Future<String> deleteCommentUsecase(
      {required String postId, required String commentId});
  Future<String> commentUsecase(
      {required String postId,
      required String text,
      required String uid,
      required String name});
  Future<String> countComment({required String postId});
}