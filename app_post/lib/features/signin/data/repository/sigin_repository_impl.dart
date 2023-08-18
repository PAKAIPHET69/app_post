import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/user.dart';
import '../../domain/repository/signin_repository.dart';
import '../datasources/signin_remote_datasource.dart';

@LazySingleton(as: SignInRepository)
class SignInRepositoryImpl implements SignInRepository {
  final SignInDatasource signInRemoteDatasource;

  SignInRepositoryImpl(this.signInRemoteDatasource);

  @override
  Future<Either<Failure, User>> signedInFacebook() async {
    try {
      final user = await signInRemoteDatasource.signInWithFacebook();
      await signInRemoteDatasource.saveUser(user);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signedInGoogle() async {
    try {
      final user = await signInRemoteDatasource.signInWithGoogle();
      await signInRemoteDatasource.saveUser(user);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, String?>> getToken() async{
    try {
      final res = await signInRemoteDatasource.getToken();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
