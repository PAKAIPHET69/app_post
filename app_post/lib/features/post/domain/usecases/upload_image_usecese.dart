import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/post_repository.dart';

@lazySingleton
class UploadImageUsecese implements UseCase<String, File> {
  final PostRepository postRepository;

  UploadImageUsecese(this.postRepository);
  @override
  Future<Either<Failure, String>> call(File params) async {
    return await postRepository.uploadImageUsecase(params);
  }
}
