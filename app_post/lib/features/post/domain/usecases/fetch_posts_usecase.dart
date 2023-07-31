import 'package:app_post/core/usecases/no_params.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/post_model.dart';
import '../repositories/post_repository.dart';

@lazySingleton
class FetchPostsUsecase extends NoParams {
  final PostRepository postRepository;

  FetchPostsUsecase(this.postRepository);
  Future<List<PostModel>> call(PostModel params) async {
    return await postRepository.getUserPost();
  }
}
