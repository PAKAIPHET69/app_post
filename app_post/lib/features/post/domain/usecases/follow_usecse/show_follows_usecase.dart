import 'package:app_post/features/post/domain/repositories/repository.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ShowFollowsUsecase {
  final Repository postRepository;

  ShowFollowsUsecase(this.postRepository);
  Stream<List<User>> call({required String uid}) {
    return postRepository.showFollows(uid: uid);
  }
}
