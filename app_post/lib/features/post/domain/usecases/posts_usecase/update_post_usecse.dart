import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../repositories/repository.dart';

@lazySingleton
class UpdatePostUsecase implements UseCase<void, Post> {
  final Repository postRepository;

  UpdatePostUsecase(this.postRepository);
  @override
  Future<Either<Failure, void>> call(Post params) async {
    return await postRepository.updatePostUsecase(params);
  }
}
