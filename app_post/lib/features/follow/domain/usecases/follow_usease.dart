import 'package:app_post/core/error/failures.dart';
import 'package:app_post/core/usecases/usecase.dart';
import 'package:app_post/features/follow/domain/repository/follow_repository.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FollowUsecase extends UseCase<void, User?> {
  final FollowRepository followRepository;

  FollowUsecase(this.followRepository);
  @override
  Future<Either<Failure, void>> call(User? params) async {
    return await followRepository.followUsecase(
        followId: params?.followId ?? '', uid: params?.uid??'');
  }
}
