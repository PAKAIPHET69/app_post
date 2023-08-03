

import 'package:app_post/core/error/failures.dart';
import 'package:app_post/core/usecases/usecase.dart';
import 'package:app_post/features/post/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeletePostUsecase implements UseCase<void, String> {
  final PostRepository postRepository;

  DeletePostUsecase(this.postRepository);
  @override
  Future<Either<Failure, void>> call(String params) async {
    return await postRepository.deletePostUsecase(params);
  }
}
