import 'package:app_post/core/usecases/no_params.dart';
import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:injectable/injectable.dart';
import '../../repositories/repository.dart';

@lazySingleton
class ShowPostsUsecase {
  final Repository postRepository;
  ShowPostsUsecase(this.postRepository);
  Stream<List<Post>> call(NoParams params) {
    return postRepository.getPostUsecase();
  }
}
