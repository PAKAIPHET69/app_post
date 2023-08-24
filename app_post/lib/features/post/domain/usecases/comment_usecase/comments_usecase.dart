import 'package:app_post/features/post/domain/repositories/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CommentUsecase {
  final Repository repository;
  CommentUsecase(this.repository);
  Future<String> call(
      {required String uid,
      required String postId,
      required String text,
      required String name,
      required String tokenID}) {
    return repository.commentUsecase(
        postId: postId, text: text, uid: uid, name: name,tokenID: tokenID);
  }
}
