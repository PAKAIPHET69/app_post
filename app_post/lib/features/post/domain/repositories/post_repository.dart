import 'dart:io';

import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../signin/domain/entity/user.dart';

abstract class PostRepository {
  Future<Either<Failure, void>> postUsecase(Post post);
  Future<Either<Failure, void>> deletePostUsecase(String pid);
  Future<Either<Failure, String>> uploadImageUsecase(File imageFile);
  Future<Either<Failure, List<Post>>> getPostUsecase();
  User getCurrentUser();
}
