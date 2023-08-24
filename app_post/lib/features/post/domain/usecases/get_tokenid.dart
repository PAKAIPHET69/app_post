import 'package:app_post/core/usecases/no_params.dart';
import 'package:app_post/features/post/domain/repositories/repository.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFollowerTokenId {
  final Repository repository;

  GetFollowerTokenId(this.repository);
  Future<User> call(NoParams params) async {
    final result = await repository.getFollowerTokens();
    return result;
  }
}
