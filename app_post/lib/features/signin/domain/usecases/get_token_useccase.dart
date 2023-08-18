import 'package:app_post/core/error/failures.dart';
import 'package:app_post/core/usecases/no_params.dart';
import 'package:app_post/core/usecases/usecase.dart';
import 'package:app_post/features/signin/domain/repository/signin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTokenUsecase implements UseCase<String?, NoParams> {
  final SignInRepository signInRepository;

  GetTokenUsecase(this.signInRepository);

  @override
  Future<Either<Failure, String?>> call(NoParams noParams) async {
    final res = await signInRepository.getToken();
    return res;
  }
}
