import 'dart:io';

import 'package:app_post/features/post/data/datasources/comment_remote_dayasource.dart';
import 'package:app_post/features/post/data/datasources/follow_remote_datesource.dart';
import 'package:app_post/features/post/domain/entity/post_cm.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../signin/domain/entity/user.dart';
import '../../domain/entity/post.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/post_remote_datasource.dart';

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  final PostRemoteDatasource postRemoteDatasource;
  final CommentRemoteDataSoure commentRemoteDataSoure;
  final FollowRemotDataSource followRemotDataSource;

  RepositoryImpl(
    this.postRemoteDatasource,
    this.commentRemoteDataSoure,
    this.followRemotDataSource,
  );
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
    final res = postRemoteDatasource.showPosts();
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
  Future<String> likePost({
    required String postId,
    required String uid,
    required String likes,
  }) async {
    try {
      final res = await postRemoteDatasource.saveLikesPost(
          postId: postId, uid: uid, likes: likes);
      return res;
    } on ServerException catch (e) {
      throw ServerFailure(e.msg.toString());
    }
  }

  // CommentRemoteDataSoure
  @override
  Stream<List<PostCM>> getPostCommentsUsecase({required String pId}) {
    final res = commentRemoteDataSoure.showComments(pId: pId);
    return res;
  }

  @override
  Future<String> commentUsecase(
      {required String postId,
      required String text,
      required String uid,
      required String name}) async {
    try {
      final result = await commentRemoteDataSoure.saveComment(
          postId: postId, text: text, uid: uid, name: name);
      return result;
    } on ServerException catch (e) {
      throw ServerFailure(e.msg.toString());
    }
  }

  @override
  Future<String> deleteCommentUsecase(
      {required String postId, required String commentId}) async {
    try {
      final res = await commentRemoteDataSoure.deleteComment(
          postId: postId, commentId: commentId);
      return res;
    } on ServerException catch (e) {
      throw ServerFailure(e.msg.toString());
    }
  }

  @override
  Future<String> getViweCm({required String postId}) async {
    try {
      final res = await commentRemoteDataSoure.countComment(postId: postId);
      return res;
    } on ServerException catch (e) {
      throw ServerFailure(e.msg.toString());
    }
  }

  // FollowRemoteDatasource
  @override
  Future<Either<Failure, void>> followUsecase(
      {required String followId, required String uid}) async {
    try {
      final res = await followRemotDataSource.saveFollowsUsers(
          uid: uid, followId: followId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<List<User>> getFollow({required String uid}) {
    final result = followRemotDataSource.showFolloeUsers(uid: uid);
    return result;
  }
}
