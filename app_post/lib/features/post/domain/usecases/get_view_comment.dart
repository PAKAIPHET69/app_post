import 'package:app_post/features/post/domain/entity/post_cm.dart';
import 'package:app_post/features/post/domain/repositories/post_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetViewCommentsUsecase {
  final PostRepository postRepository;
  GetViewCommentsUsecase(this.postRepository);
  Future<List<PostCM>> call({required String pid}) {
    final res = postRepository.getViweCm(postId: pid);
    return res;
  }
}
