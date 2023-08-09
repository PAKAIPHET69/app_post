import 'package:app_post/core/error/exceptions.dart';
import 'package:app_post/core/error/failures.dart';
import 'package:app_post/features/follow/data/datasources/follow_remonte_datasources.dart';
import 'package:app_post/features/follow/domain/repository/follow_repository.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FollowRepository)
class FollowRepositoryImpl implements FollowRepository {
  final FollowRemoteDatasoource followRemoteDatasource;

  FollowRepositoryImpl(this.followRemoteDatasource);
  @override
  Future<Either<Failure, void>> followUsecase(
      {required String followId, required String uid}) async {
    try {
      final res =
          await followRemoteDatasource.followUser(uid: uid, followId: followId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

   @override
  User getCurrentUser() {
    return followRemoteDatasource.getCurrentUser();
  }
}
