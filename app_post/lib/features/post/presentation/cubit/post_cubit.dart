// ignore_for_file: unused_element, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:app_post/core/usecases/no_params.dart';
import 'package:app_post/core/util/app_navigator.dart';
import 'package:app_post/core/util/constant.dart';
import 'package:app_post/core/util/route.dart';
import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/domain/usecases/delete_post_usecse.dart';
import 'package:app_post/features/post/domain/usecases/fetch_posts_usecase.dart';
import 'package:app_post/features/post/domain/usecases/get_currentupost.dart';
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
  final GetCurrentUser getCurrentUserUsecase;
  final GetCurPost getCurrentPost;
  final UploadImageUsecese uploadImageUsecese;
  final GetPostsUsecase getPostsUsecase;
  final DeletePostUsecase deletePostUsecase;
  final UpdatePostUsecase updatePostUsecase;
  PostCubit(
    this.postUsecase,
    this.getCurrentUserUsecase,
    this.uploadImageUsecese,
    this.getPostsUsecase,
    this.deletePostUsecase,
    this.updatePostUsecase,
    this.getCurrentPost,
  ) : super(const PostState());

  final ImagePicker picker = ImagePicker();
  final TextEditingController descipController = TextEditingController();

  //////////////// Delete ////////////////////////////////
  Future<void> deletePost(String pid) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final result = await deletePostUsecase(pid);
    result.fold((error) {
      emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg));
    }, (delePID) {
      emit(state.copyWith(
        dataStatus: DataStatus.success,
      ));
      AppNavigator.pushAndRemoveUntil(AppRoute.nvbRoute);
    });
  }

  ////////////////// Uadte Post //////////////////////////////
  Future<void> updatePost(descipController, getData, urlm) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final url = await uploadImage(state.imageFile);
    Post postData = Post(
      userName: state.currentUser?.displayName,
      userId: state.currentUser?.uid, //From current user that logged in
      pid: getData,
      imageUrl: urlm,
      datePublished: DateTime.now(),
      description: descipController, //From textfield
    );
    final result = await updatePostUsecase(postData);

    result.fold((error) {
      emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg));
    }, (updatePost) {
      emit(state.copyWith(dataStatus: DataStatus.success));
    });
  }

  /////////////  PostUp button to Save /////////////
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
      imageUrl: url,
      datePublished: DateTime.now(),
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

  ///////////// Photo to button /////////////
  Future<void> getImage(ImageSource media) async {
    final img = await picker.pickImage(source: media);
    if (img != null) {
      File file = File(img.path);
      emit(state.copyWith(imageFile: file));
      final url = await uploadImage(state.imageFile);
      emit(state.copyWith(dataStatus: DataStatus.success, urlPhoto: url));
    }
  }

  ///////////// Update image to URL /////////////
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

  /////////////// Get Post from  clouad_firestore////////////////////
  Future<void> getUserPosts() async {
    emit(state.copyWith(
      dataStatus: DataStatus.loading,
    ));
    final result = await getPostsUsecase(NoParams());

    result.fold((error) {
      emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg));
    }, (post) {
      emit(state.copyWith(dataStatus: DataStatus.success, listPosts: post));
    });
  }

  ////////////////////////////////////////////////////////
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

  void getCurPost() {
    emit(state.copyWith(
      dataStatus: DataStatus.loading,
    ));
    final res = getCurrentPost(NoParams());
    emit(state.copyWith(
      dataStatus: DataStatus.success,
      post: res,
    ));
  }
}
