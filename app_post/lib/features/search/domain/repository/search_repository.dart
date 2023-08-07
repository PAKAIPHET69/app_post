

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../signin/domain/entity/user.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<User>>> getUserUsecase({String? username});
}
