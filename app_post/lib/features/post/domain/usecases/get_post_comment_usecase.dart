import 'package:app_post/features/post/domain/entity/post_cm.dart';
import 'package:app_post/features/post/domain/repositories/post_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPostCommentsUsecase {
  final PostRepository postRepository;
  GetPostCommentsUsecase(this.postRepository);
  Stream<List<PostCM>> call({required String pid}) {
    return postRepository.getPostCommentsUsecase(pId: pid);
  }
}
