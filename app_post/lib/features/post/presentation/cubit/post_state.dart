import 'dart:io';

import 'package:app_post/features/post/domain/entity/post_cm.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/util/constant.dart';
import '../../../signin/domain/entity/user.dart';
import '../../domain/entity/post.dart';

class PostState extends Equatable {
  final DataStatus? dataStatus;
  final String? error;
  final Post? post;
  final User? currentUser;
  final File? imageFile;
  final User? listUseInfo;
  final List<Post>? listPosts;
  final List<User>? listUser;
  final List<Comment>? listPostCM;
  final List? countCM;
  final String? delePid;

  const PostState({
    this.listUseInfo,
    this.listUser,
    this.listPostCM,
    this.imageFile,
    this.dataStatus,
    this.error,
    this.post,
    this.currentUser,
    this.delePid,
    this.listPosts,
    this.countCM,
  });

  @override
  List<Object?> get props => [
        dataStatus,
        error,
        post,
        imageFile,
        listUseInfo,
        listPosts,
        delePid,
        listPostCM,
        countCM
      ];

  PostState copyWith({
    DataStatus? dataStatus,
    String? error,
    Post? post,
    User? currentUser,
    User? listUseInfo,
    File? imageFile,
    List<Post>? listPosts,
    List<User>? listUser,
    List<Comment>? listPostCM,
    List? countCM,
    String? delePid,
  }) {
    return PostState(
        dataStatus: dataStatus ?? this.dataStatus,
        error: error ?? this.error,
        post: post ?? this.post,
        currentUser: currentUser ?? this.currentUser,
        imageFile: imageFile ?? this.imageFile,
        delePid: delePid ?? this.delePid,
        listPostCM: listPostCM ?? this.listPostCM,
        listPosts: listPosts ?? this.listPosts,
        countCM: countCM ?? this.countCM,
        listUser: listUser ?? this.listUser
        ,listUseInfo: listUseInfo?? this.listUseInfo);
  }
}
