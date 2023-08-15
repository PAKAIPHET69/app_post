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
  final List<Post>? listPosts;
  final List<PostCM>? listPostCM;
  final String? delePid;

  const PostState({
    this.listPostCM,
    this.imageFile,
    this.dataStatus,
    this.error,
    this.post,
    this.currentUser,
    this.delePid,
    this.listPosts,
  });

  @override
  List<Object?> get props => [
        dataStatus,
        error,
        post,
        imageFile,
        listPosts,
        delePid,
        listPostCM,
      ];

  PostState copyWith({
    DataStatus? dataStatus,
    String? error,
    Post? post,
    User? currentUser,
    File? imageFile,
    List<Post>? listPosts,
    List<PostCM>? listPostCM,
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
    );
  }
}
