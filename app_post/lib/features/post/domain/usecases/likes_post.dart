import 'package:app_post/features/post/domain/repositories/post_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LikesPostUsecase {
  final PostRepository postRepository;
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
