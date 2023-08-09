import 'package:app_post/core/error/failures.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:dartz/dartz.dart';

abstract class FollowRepository {
  Future<Either<Failure, void>> followUsecase(
      {required String followId, required String uid});
  User getCurrentUser();
}
