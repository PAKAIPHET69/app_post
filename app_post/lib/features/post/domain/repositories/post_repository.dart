import 'dart:io';

import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../signin/domain/entity/user.dart';

abstract class PostRepository {
  Future<Either<Failure, void>> postUsecase(Post post);
  User getCurrentUser();
  Future<Either<Failure, String>> uploadToFirebaseStorage(File imageFile);
  Future<Either<Failure, List<Post>>> getUserPost();
}
