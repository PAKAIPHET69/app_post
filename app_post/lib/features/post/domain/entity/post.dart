import 'package:app_post/features/post/data/model/post_model.dart';
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String? description;
  final String? pid;
  final DateTime? timestemp;
  final String? userId;
  final String? imageUrl;
  final String? userName;

  const Post({
    this.userName,
    this.userId,
    this.description,
    this.pid,
    this.timestemp,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
        description,
        userName,
        pid,
        timestemp,
        userId,
        imageUrl,
      ];

  PostModel toModel() => PostModel(
        userName: userName,
        description: description,
        pid: pid,
        userId: userId,
        timestemp: timestemp,
        imageUrl: imageUrl,
      );
}
