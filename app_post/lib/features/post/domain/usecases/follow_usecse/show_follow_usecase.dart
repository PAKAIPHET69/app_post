import 'package:app_post/features/post/domain/repositories/repository.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ShowFollowUsecase {
  final Repository postRepository;

  ShowFollowUsecase(this.postRepository);
  Future<List<User>> call({required String uid}) {
    return postRepository.getFollow(uid: uid);
  }
}
