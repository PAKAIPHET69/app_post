import 'package:app_post/features/post/domain/entity/post_cm.dart';
import 'package:app_post/features/post/domain/repositories/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPostCommentsUsecase {
  final Repository postRepository;
  GetPostCommentsUsecase(this.postRepository);
  Stream<List<PostCM>> call({required String pid}) {
    final res = postRepository.getPostCommentsUsecase(pId: pid);
    return res;
  }
}
