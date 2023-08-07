

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../signin/domain/entity/user.dart';
import '../repository/search_repository.dart';

@lazySingleton
class SearchUsecse extends UseCase<List<User>, String> {
  final SearchRepository searchRepository;

  SearchUsecse(this.searchRepository);
  @override
  Future<Either<Failure, List<User>>> call(String? params) async {
    return await searchRepository.getUserUsecase(username: params);
  }
}
