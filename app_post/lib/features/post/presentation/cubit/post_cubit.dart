// ignore_for_file: unused_element, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:io';
import 'package:app_post/core/usecases/no_params.dart';
import 'package:app_post/core/util/app_navigator.dart';
import 'package:app_post/core/util/constant.dart';
import 'package:app_post/core/util/route.dart';
import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/domain/entity/post_cm.dart';
import 'package:app_post/features/post/domain/usecases/comment_usecase/comments_usecase.dart';
import 'package:app_post/features/post/domain/usecases/comment_usecase/delete_comment_usecase.dart';
import 'package:app_post/features/post/domain/usecases/follow_usecse/show_follows_usecase.dart';
import 'package:app_post/features/post/domain/usecases/getInfo_usecase.dart';
import 'package:app_post/features/post/domain/usecases/get_tokenid.dart';
import 'package:app_post/features/post/domain/usecases/posts_usecase/delete_post_usecse.dart';
import 'package:app_post/features/post/domain/usecases/follow_usecse/follow_usecse.dart';
import 'package:app_post/features/post/domain/usecases/comment_usecase/show_comment_usecase.dart';
import 'package:app_post/features/post/domain/usecases/posts_usecase/show_posts_usecase.dart';
import 'package:app_post/features/post/domain/usecases/comment_usecase/count_comment_usecase.dart';
import 'package:app_post/features/post/domain/usecases/likes_post.dart';
import 'package:app_post/features/post/domain/usecases/posts_usecase/update_post_usecse.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../domain/usecases/get_currentuser.dart';
import '../../domain/usecases/posts_usecase/save_post_usecase.dart';
import '../../domain/usecases/upload_image_usecese.dart';

@injectable
class PostCubit extends Cubit<PostState> {
  final SavePostUsecase savepostUsecase;
  final ShowPostsUsecase showPostsUsecase;
  final DeletePostUsecase deletePostUsecase;
  final UpdatePostUsecase updatePostUsecase;
  final LikesPostUsecase likesPostUsecase;

  final UploadImageUsecese uploadImageUsecese;
  final GetCurrentUser getCurrentUserUsecase;

  final CommentUsecase commentUsecase;
  final ShowCommentsUsecase showCommentsUsecase;
  final CountCommentUsecase countCommentsUsecase;
  final DeleteCommentUsecase deleteCommentUsecase;

  final FollowUsecase followUsecase;
  final ShowFollowsUsecase showFollowsUsecase;

  final GetInfoUsecase getInfoUsecase;
  final GetFollowerTokenId getFollowerTokenId;

  PostCubit(
    this.savepostUsecase,
    this.getCurrentUserUsecase,
    this.uploadImageUsecese,
    this.showPostsUsecase,
    this.deletePostUsecase,
    this.updatePostUsecase,
    this.commentUsecase,
    this.showCommentsUsecase,
    this.deleteCommentUsecase,
    this.countCommentsUsecase,
    this.likesPostUsecase,
    this.followUsecase,
    this.showFollowsUsecase,
    this.getInfoUsecase,
    this.getFollowerTokenId,
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
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final postId = Uuid().v1();
    final url = await uploadImage(state.imageFile);
    final tokenUser = await getToken();
    print(tokenUser);
    Post postData = Post(
      listTokens: tokenUser,
      userName: state.currentUser?.displayName,
      userId: state.currentUser?.uid, //From current user that logged in
      pid: postId,
      likes: [],
      imageUrl: url,
      timestamp: DateTime.now(),
      description: descipController, //From textfield
    );

    final result = await savepostUsecase(postData);
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

  Future<void> showFollows({required String uid}) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final result = showFollowsUsecase(uid: uid);
    result.listen((follow) {
      emit(state.copyWith(dataStatus: DataStatus.success, listUser: follow));
    });
  }

  /// Show Post from  clouad_firestore ///
  Future<void> showPostsUsers() async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final result = showPostsUsecase(NoParams());
    sub = result.listen((post) async {
      List<Post> getList = [];
      for (var index = 0; index < post.length; index++) {
        final i = post[index];
        final result = await getInfoUsecase(uid: i.userId ?? "");
        final countComment = await countCommentsUsecase(pid: i.pid ?? '');

        final List<Post> updateList = List<Post>.from(post);
        updateList[index] = i.copyWith(
            followers: result.followers ?? [],
            countCM: countComment,
            listTokens: result.tokenID);
        print(updateList);
        getList.add(updateList[index]);
        print(getList);
        if (getList.length == post.length) {
          print(getList);
          emit(state.copyWith(
              dataStatus: DataStatus.success, listPosts: getList));
        }
        // final countComment = await countComments(pid: i.pid ?? '');
        // final updateList = List<Post>.from(post);
        // updateList[index] = i.copyWith(countCM: countComment);

        // getList.add(updateList[index]);
        // if (post.isNotEmpty) {
        //   emit(state.copyWith(
        //       dataStatus: DataStatus.success, listPosts: getList));
        // }
      }
      // if (post.isNotEmpty) {
      //   emit(state.copyWith(dataStatus: DataStatus.success, listPosts: post));
      // }
    });
  }

  Future<void> saveFollowUser(
      {required String uid, required String followId}) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final res = await followUsecase(User(uid: uid, followId: followId));
    res.fold((error) {
      emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg));
    }, (follow) {
      emit(state.copyWith(dataStatus: DataStatus.success));
    });
  }

  /// Get CurrenUser
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

  /// Save Comment
  Future<String> saveComment(
      {required String postId,
      required String text,
      required List<String> tokenID}) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final result = await commentUsecase(
        tokenID: tokenID,
        postId: postId,
        text: textController.text,
        uid: state.currentUser?.uid ?? '',
        name: state.currentUser?.displayName ?? '');
    return result;
  }

  /// Show Comments Users
  Future<void> showComments(String pId) async {
    emit(state.copyWith(
      dataStatus: DataStatus.loading,
    ));
    final result = showCommentsUsecase(pid: pId);
    sub = result.listen((postCM) {
      if (postCM.isNotEmpty) {
        final updateList = List<Comment>.from(postCM);
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
    final result = await deleteCommentUsecase(
      postId: postId,
      commentId: commentId,
    );
    return result;
  }

  // Likes Posts
  Future<String> likesPost({required String postId}) async {
    final result = await likesPostUsecase(
        postId: postId,
        likes: state.currentUser?.uid ?? '',
        uid: state.currentUser?.uid ?? '');
    return result;
  }

  Future<List<String>> getToken() async {
    List<String> listFollowToken = [];
    final result = await getFollowerTokenId(NoParams());
    final a = result.followers;
    for (var index = 0; index < a!.length; index++) {
      final i = a[index];
      final result = await getInfoUsecase(uid: i);
      listFollowToken.addAll(result.tokenID ?? []);
    }
    return listFollowToken;
  }
}
