import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/domain/repositories/post_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPostCommentsUsecase {
  final PostRepository postRepository;
  GetPostCommentsUsecase(this.postRepository);
  Stream<List<Post>> call({required String pid}) {
    return postRepository.getPostCommentsUsecase(pId: pid);
  }
}
