import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/post.dart';
import '../repositories/repository.dart';

@lazySingleton
class PostUsecase implements UseCase<void, Post> {
  final Repository postRepository;

  PostUsecase(this.postRepository);
  @override
  Future<Either<Failure, void>> call(Post params) async {
    return await postRepository.postUsecase(params);
  }
}
