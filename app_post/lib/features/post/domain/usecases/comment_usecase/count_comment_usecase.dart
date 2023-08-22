import 'package:app_post/features/post/domain/repositories/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CountCommentUsecase {
  final Repository postRepository;
  CountCommentUsecase(this.postRepository);
  Future<String> call({required String pid}) {
    final res = postRepository.getViweCm(postId: pid);
    return res;
  }
}
