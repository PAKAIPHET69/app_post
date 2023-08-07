import 'package:app_post/features/search/data/datasource/search_remote_datasource.dart';
import 'package:app_post/features/search/domain/repository/search_repository.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDatasource searchRemoteDatasource;

  SearchRepositoryImpl(this.searchRemoteDatasource);

  @override
  Future<Either<Failure, List<User>>> getUserUsecase({String? username}) async {
    try {
      final res = await searchRemoteDatasource.getlistUser(username: username ?? '');
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
