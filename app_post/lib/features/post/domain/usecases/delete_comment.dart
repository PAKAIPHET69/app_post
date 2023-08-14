import 'package:app_post/features/post/domain/repositories/post_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteCommentUsecase {
  final PostRepository postRepository;

  DeleteCommentUsecase(this.postRepository);
  Future<String> call(
      {required String postId, required String commentId}) async {
    return await postRepository.deleteCommentUsecase(
        postId: postId, commentId: commentId);
  }
}
