import 'package:app_post/features/post/domain/repositories/repository.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetInfoUsecase {
  final Repository repository;

  GetInfoUsecase(this.repository);
  Future<User> call({required String uid}) async {
    final result = await repository.getInfo(uid: uid);
    return result;
  }
}
