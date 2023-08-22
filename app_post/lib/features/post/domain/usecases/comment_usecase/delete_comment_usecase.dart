import 'package:app_post/features/post/domain/repositories/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteCommentUsecase {
  final Repository postRepository;

  DeleteCommentUsecase(this.postRepository);
  Future<String> call(
      {required String postId, required String commentId}) async {
    return await postRepository.deleteCommentUsecase(
        postId: postId, commentId: commentId);
  }
}
