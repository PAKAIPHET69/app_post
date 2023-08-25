import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../repositories/repository.dart';

@lazySingleton
class SavePostUsecase {
  final Repository postRepository;

  SavePostUsecase(this.postRepository);
  Future<Either<Failure, void>> call(
      {required String imageUrl,
      required String description,
      required String userId,
      required String userName,
      required List<String> listTokens}) async {
    return await postRepository.postUsecase(
        description: description,
        imageUrl: imageUrl,
        listTokens: listTokens,
        userId: userId,
        userName: userName);
  }
}
