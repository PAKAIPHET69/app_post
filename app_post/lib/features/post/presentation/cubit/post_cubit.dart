// ignore_for_file: unused_element, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:io';
import 'package:app_post/core/usecases/no_params.dart';
import 'package:app_post/core/util/app_navigator.dart';
import 'package:app_post/core/util/constant.dart';
import 'package:app_post/core/util/route.dart';
import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/domain/entity/post_cm.dart';
import 'package:app_post/features/post/domain/usecases/comments_usecase.dart';
import 'package:app_post/features/post/domain/usecases/delete_comment.dart';
import 'package:app_post/features/post/domain/usecases/delete_post_usecse.dart';
import 'package:app_post/features/post/domain/usecases/get_post_comment_usecase.dart';
import 'package:app_post/features/post/domain/usecases/get_posts_usecase.dart';
import 'package:app_post/features/post/domain/usecases/get_view_comment.dart';
import 'package:app_post/features/post/domain/usecases/likes_post.dart';
import 'package:app_post/features/post/domain/usecases/update_post_usecse.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../domain/usecases/get_currentuser.dart';
import '../../domain/usecases/post_usecase.dart';
import '../../domain/usecases/upload_image_usecese.dart';

@injectable
class PostCubit extends Cubit<PostState> {
  final PostUsecase postUsecase; 
  final UploadImageUsecese uploadImageUsecese;
  final GetCurrentUser getCurrentUserUsecase;
  final GetPostCommentsUsecase getPostCommentsUsecase;
  final GetPostsUsecase getPostsUsecase;
  final GetViewCommentsUsecase getViewCommentsUsecase;
  final DeletePostUsecase deletePostUsecase;
  final DeleteCommentUsecase deleteCommentUsecase;
  final UpdatePostUsecase updatePostUsecase;
  final CommentUsecase commentUsecase;
  final LikesPostUsecase likesPostUsecase;
  
  PostCubit(
    this.postUsecase,
    this.getCurrentUserUsecase,
    this.uploadImageUsecese,
    this.getPostsUsecase,
    this.deletePostUsecase,
    this.updatePostUsecase,
    this.commentUsecase,
    this.getPostCommentsUsecase,
    this.deleteCommentUsecase,
    this.getViewCommentsUsecase,
    this.likesPostUsecase,
  ) : super(const PostState());
  StreamSubscription<dynamic>? sub;

  final ImagePicker picker = ImagePicker();
  final TextEditingController descipController = TextEditingController();
  final TextEditingController textController = TextEditingController();
// close stream
  @override
  Future<void> close() async {
    await sub?.cancel();
    return super.close();
  }

  ///  Delete ///
  Future<void> deletePost(String pid) {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    return deletePostUsecase(pid);
  }

  /// Uadte Post ///
  Future<void> updatePost(descipController, getData, urlm) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final url = await uploadImage(state.imageFile);
    final newUrl = await urlm == null ? url : urlm;
    Post postData = Post(
      userName: state.currentUser?.displayName,
      userId: state.currentUser?.uid, //From current user that logged in
      pid: getData,
      imageUrl: newUrl,
      timestamp: DateTime.now(),
      description: descipController, //From textfield
    );
    final result = await updatePostUsecase(postData);

    result.fold((error) {
      emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg));
    }, (updatePost) {
      emit(state.copyWith(dataStatus: DataStatus.success));
      AppNavigator.pushAndRemoveUntil(AppRoute.nvbRoute);
    });
  }

  /// PostUp button to Save ///
  Future<void> postUp(descipController) async {
    emit(state.copyWith(
      dataStatus: DataStatus.loading,
    ));
    final postId = Uuid().v1();
    final url = await uploadImage(state.imageFile);
    Post postData = Post(
      userName: state.currentUser?.displayName,
      userId: state.currentUser?.uid, //From current user that logged in
      pid: postId,
      likes: [],
      imageUrl: url,
      timestamp: DateTime.now(),
      description: descipController, //From textfield
    );

    final result = await postUsecase(postData);
    result.fold((error) {
      emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg));
    }, (user) {
      emit(state.copyWith(
        dataStatus: DataStatus.success,
      ));
      AppNavigator.pushAndRemoveUntil(AppRoute.nvbRoute);
    });
  }

  /// Photo to button ///
  Future<void> getImage(ImageSource media) async {
    final img = await picker.pickImage(source: media);
    if (img != null) {
      File file = File(img.path);
      emit(state.copyWith(imageFile: file));
    }
  }

  ///Image to URL ///
  Future<String?> uploadImage(File? file) async {
    String? url;
    if (file != null) {
      final ref = await uploadImageUsecese(file);
      ref.fold((error) {
        emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg));
        return null;
      }, (imageUrl) {
        url = imageUrl;
      });
    }
    return url;
  }

  /// Get Post from  clouad_firestore ///
  Future<void> getUserPosts() async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final result = getPostsUsecase(NoParams());
    result.listen((post) async {
      // List<Post> getList = [];
      // for (var index = 0; index < post.length; index++) {
      //   final i = post[index];
      //   final countComment = await getViewCm(pid: i.pid ?? '');
      //   final updateList = List<Post>.from(post);
      //   updateList[index] = i.copyWith(countCM: countComment);

      //   getList.add(updateList[index]);
      //   if (post.isNotEmpty) {
      //     emit(state.copyWith(
      //         dataStatus: DataStatus.success, listPosts: getList));
      //   }
      // }
      if (post.isNotEmpty) {
        emit(state.copyWith(dataStatus: DataStatus.success, listPosts: post));
      }
    });
  }

  // Count Comment
  Future<String> getViewCm({required String pid}) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final result = await getViewCommentsUsecase(pid: pid);
    return result;
  }

  ////Get CurrenUser ///
  void getCurrentUser() {
    emit(state.copyWith(
      dataStatus: DataStatus.loading,
    ));
    final res = getCurrentUserUsecase(NoParams());
    emit(state.copyWith(
      dataStatus: DataStatus.success,
      currentUser: res,
    ));
  }

  ///Post Comment
  Future<String> postComment({
    required String postId,
    required String text,
  }) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final result = await commentUsecase(
        postId: postId,
        text: textController.text,
        uid: state.currentUser?.uid ?? '',
        name: state.currentUser?.displayName ?? '');
    return result;
  }

  /// Get post comment
  Future<void> getPostComments(String pId) async {
    emit(state.copyWith(
      dataStatus: DataStatus.loading,
    ));
    final result = getPostCommentsUsecase(pid: pId);
    sub = result.listen((postCM) {
      if (postCM.isNotEmpty) {
        final updateList = List<PostCM>.from(postCM);
        emit(state.copyWith(
            dataStatus: DataStatus.success, listPostCM: updateList));
      }
    });
  }

  //Delete Comment
  Future<String> deletePostCM({
    required String postId,
    required String commentId,
  }) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final result = deleteCommentUsecase(
      postId: postId,
      commentId: commentId,
    );
    return result;
  }

  // Likes Posts
  Future<String> likesPost({required String postId}) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final result = await likesPostUsecase(
      postId: postId,
      likes: state.currentUser?.uid ?? '',
      uid: state.currentUser?.uid ?? '',
    );
    return result;
  }
}
