import 'package:app_post/features/follow/domain/repository/follow_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/no_params.dart';
import '../../../../core/usecases/usecase_sync.dart';
import '../../../signin/domain/entity/user.dart';

@lazySingleton
class GetCurrentUser extends SynchronousUseCase<User, NoParams> {
  final FollowRepository followRepository;

  GetCurrentUser(this.followRepository);
  @override
  User call(NoParams params) {
    return followRepository.getCurrentUser();
  }
}
