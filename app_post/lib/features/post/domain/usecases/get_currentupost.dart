import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/no_params.dart';
import '../../../../core/usecases/usecase_sync.dart';
import '../repositories/post_repository.dart';

@lazySingleton
class GetCurPost extends SynchronousUseCase<Post, NoParams> {
  final PostRepository postRepository;

  GetCurPost(this.postRepository);
  @override
  Post call(NoParams params) {
    return postRepository.getCurrentPost();
  }
}
