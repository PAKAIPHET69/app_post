import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../signin/domain/entity/user.dart';
import '../../domain/entity/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_datasource.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final PostRemoteDatasource postRemoteDatasource;

  PostRepositoryImpl(this.postRemoteDatasource);
  @override
  Future<Either<Failure, void>> postUsecase(Post post) async {
    try {
      final res = await postRemoteDatasource.savePost(post.toModel());
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  User getCurrentUser() {
    return postRemoteDatasource.getCurrentUser();
  }

  @override
  Future<Either<Failure, String>> uploadImageUsecase(File imageFile) async {
    try {
      final ref = await postRemoteDatasource.uploadImageToStorage(imageFile);
      return Right(ref);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<List<Post>> getPostUsecase() {
    final res = postRemoteDatasource.getUserPosts();
    return res;
  }

  @override
  Future<Either<Failure, void>> deletePostUsecase(String pid) async {
    try {
      final res = await postRemoteDatasource.deletePost(pid);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updatePostUsecase(Post post) async {
    try {
      final res = await postRemoteDatasource.updatePost(post.toModel());
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<String> commentUsecase(
      {required String postId,
      required String text,
      required String uid,
      required String name}) async {
    try {
      final result = await postRemoteDatasource.postComment(
          postId: postId, text: text, uid: uid, name: name);
      return result;
    } on ServerException catch (e) {
      throw ServerFailure(e.msg.toString());
    }
  }

  
  @override
  Stream<List<Post>> getPostCommentsUsecase({required String pId}) {
    final res = postRemoteDatasource.getPostComments(pId: pId);
    return res;
  }
}
