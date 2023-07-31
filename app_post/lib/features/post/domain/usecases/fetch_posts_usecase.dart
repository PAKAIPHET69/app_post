import 'package:app_post/core/error/failures.dart';
import 'package:app_post/core/usecases/no_params.dart';
import 'package:app_post/core/usecases/usecase.dart';
import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../repositories/post_repository.dart';

@lazySingleton
class FetchPostsUsecase extends UseCase<List<Post>, NoParams> {
  final PostRepository postRepository;

  FetchPostsUsecase(this.postRepository);

  @override
  Future<Either<Failure, List<Post>>> call(NoParams params) async {
    return await postRepository.getUserPost();
  }
}
