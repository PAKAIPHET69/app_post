import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/post_repository.dart';

@lazySingleton
class UpdatePostUsecase implements UseCase<void, String> {
  final PostRepository postRepository;

  UpdatePostUsecase(this.postRepository);
  @override
  Future<Either<Failure, void>> call(String params) async {
    return await postRepository.updatePostUsecase(params);
  }
}
