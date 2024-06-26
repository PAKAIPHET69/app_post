import 'dart:io';

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
  final String? delePid;

  const PostState(
      {this.imageFile,
      this.dataStatus,
      this.error,
      this.post,
      this.currentUser,
      this.delePid,
      this.listPosts});

  @override
  List<Object?> get props =>
      [dataStatus, error, post, imageFile, listPosts, delePid];

  PostState copyWith({
    DataStatus? dataStatus,
    String? error,
    Post? post,
    User? currentUser,
    File? imageFile,
    List<Post>? listPosts,
    String? delePid,
  }) {
    return PostState(
        dataStatus: dataStatus ?? this.dataStatus,
        error: error ?? this.error,
        post: post ?? this.post,
        currentUser: currentUser ?? this.currentUser,
        imageFile: imageFile ?? this.imageFile,
        delePid: delePid ?? this.delePid,
        listPosts: listPosts ?? this.listPosts);
  }
}
