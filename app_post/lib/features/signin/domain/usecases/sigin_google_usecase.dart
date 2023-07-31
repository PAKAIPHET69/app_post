import 'package:app_post/core/error/failures.dart';
import 'package:app_post/core/usecases/no_params.dart';
import 'package:app_post/core/usecases/usecase.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:app_post/features/signin/domain/repository/signin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SigInGoogleUsecase implements UseCase<User, NoParams> {
  final SignInRepository signInRepository;

  SigInGoogleUsecase(this.signInRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await signInRepository.signedInGoogle();
  }
}
