import 'package:app_post/core/usecases/no_params.dart';
import 'package:app_post/features/post/domain/repositories/post_repository.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFollowUsecase {
  final PostRepository postRepository;

  GetFollowUsecase(this.postRepository);
  Stream<List<User>> call(NoParams params) {
    return postRepository.getFollow();
  }
}
