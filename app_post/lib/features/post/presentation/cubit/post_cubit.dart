// ignore_for_file: unused_element, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:app_post/core/usecases/no_params.dart';
import 'package:app_post/core/util/app_navigator.dart';
import 'package:app_post/core/util/constant.dart';
import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/domain/usecases/delete_post_usecse.dart';
import 'package:app_post/features/post/domain/usecases/fetch_posts_usecase.dart';
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
  final UploadImageUsecese uploadImageUsecese;
  final GetPostsUsecase getPostsUsecase;
  final DeletePostUsecase deletePostUsecase;
  PostCubit(
    this.postUsecase,
    this.getCurrentUserUsecase,
    this.uploadImageUsecese,
    this.getPostsUsecase,
    this.deletePostUsecase,
  ) : super(const PostState());

  final ImagePicker picker = ImagePicker();
  final TextEditingController descipController = TextEditingController();
  //String deletpid = 'd60a3fd0-3198-11ee-8101-35c4068adfb5';

  Future<void> delePost(String pid) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final result = await deletePostUsecase(pid);
    result.fold((error) {
      emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg));
    }, (delePID) {
      emit(state.copyWith(
        dataStatus: DataStatus.success,
      ));
    });
    // emit(state.copyWith(dataStatus: DataStatus.failure,error: ))
  }

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

  //postUp
  Future<void> postUp(descipController) async {
    emit(state.copyWith(
      dataStatus: DataStatus.loading,
    ));
    final url = await uploadImage(state.imageFile);
    final postId = await Uuid().v1();
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
      AppNavigator.goBack();
    });
  }

  Future<void> getImage(ImageSource media) async {
    final img = await picker.pickImage(source: media);
    if (img != null) {
      File file = File(img.path);
      emit(state.copyWith(imageFile: file));
    }
  }

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
}
