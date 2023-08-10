import 'package:app_post/features/post/domain/repositories/post_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CommentUsecase {
  final PostRepository postRepository;
  CommentUsecase(this.postRepository);
  Future<String> call(
      {required String uid,
      required String postId,
      required String text,
      required String name}) {
    return postRepository.commentUsecase(postId: postId, text: text, uid: uid, name: name);
  }
}
