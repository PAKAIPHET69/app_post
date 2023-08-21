import 'package:app_post/core/error/failures.dart';
import 'package:app_post/core/usecases/usecase.dart';
import 'package:app_post/features/post/domain/repositories/post_repository.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FollowUsecase extends UseCase<void, User?> {
  final PostRepository postRepository;

  FollowUsecase(this.postRepository);
  @override
  Future<Either<Failure, void>> call(User? params) async {
    return await postRepository.followUsecase(
        followId: params?.followId ?? '', uid: params?.uid ?? '');
  }
}
