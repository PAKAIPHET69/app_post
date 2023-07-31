import 'package:injectable/injectable.dart';

import '../../../../core/usecases/no_params.dart';
import '../../../../core/usecases/usecase_sync.dart';
import '../../../signin/domain/entity/user.dart';
import '../repositories/post_repository.dart';

@lazySingleton
class GetCurrentUser extends SynchronousUseCase<User, NoParams> {
  final PostRepository postRepository;

  GetCurrentUser(this.postRepository);
  @override
  User call(NoParams params) {
    return postRepository.getCurrentUser();
  }
}
