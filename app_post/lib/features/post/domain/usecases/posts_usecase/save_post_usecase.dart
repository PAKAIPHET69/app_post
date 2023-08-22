import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../entity/post.dart';
import '../../repositories/repository.dart';

@lazySingleton
class SavePostUsecase implements UseCase<void, Post> {
  final Repository postRepository;

  SavePostUsecase(this.postRepository);
  @override
  Future<Either<Failure, void>> call(Post params) async {
    return await postRepository.postUsecase(params);
  }
}
