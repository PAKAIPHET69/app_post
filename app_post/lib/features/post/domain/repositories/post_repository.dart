import 'dart:io';

import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/domain/entity/post_cm.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../signin/domain/entity/user.dart';

abstract class PostRepository {
  Future<Either<Failure, void>> postUsecase(Post post);
  Future<Either<Failure, void>> deletePostUsecase(String pid);
  Future<Either<Failure, void>> updatePostUsecase(Post post);
  Future<Either<Failure, String>> uploadImageUsecase(File imageFile);
  Stream<List<Post>> getPostUsecase();
  Stream<List<PostCM>> getPostCommentsUsecase({required String pId});
  User getCurrentUser();
  Future<String> commentUsecase(
      {required String postId,
      required String text,
      required String uid,
      required String name});
}
