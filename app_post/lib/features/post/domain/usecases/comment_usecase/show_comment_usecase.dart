import 'package:app_post/features/post/domain/entity/post_cm.dart';
import 'package:app_post/features/post/domain/repositories/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ShowCommentsUsecase {
  final Repository postRepository;
  ShowCommentsUsecase(this.postRepository);
  Stream<List<Comment>> call({required String pid}) {
    final res = postRepository.showCommentsUsecase(pId: pid);
    return res;
  }
}
