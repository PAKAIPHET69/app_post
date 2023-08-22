import 'package:app_post/features/post/domain/repositories/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LikesPostUsecase {
  final Repository postRepository;
  LikesPostUsecase(this.postRepository);
  Future<String> call({
    required String postId,
    required String uid,
    required String likes,
  }) async {
    return await postRepository.likePost(
      postId: postId,
      uid: uid,
      likes: likes,
    );
  }
}
