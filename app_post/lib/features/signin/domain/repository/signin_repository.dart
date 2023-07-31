import 'package:app_post/core/error/failures.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:dartz/dartz.dart';

abstract class SignInRepository {
  Future<Either<Failure, User>> signedInGoogle();
  Future<Either<Failure, User>> signedInFacebook();
}
