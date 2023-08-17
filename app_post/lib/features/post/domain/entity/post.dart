import 'package:app_post/features/post/data/model/post_model.dart';
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String? description;
  final String? pid;
  final DateTime? timestamp;
  final String? userId;
  final String? imageUrl;
  final String? userName;
  final List? likes;
  final String? countCM;

  const Post({
    this.likes,
    this.userName,
    this.userId,
    this.description,
    this.pid,
    this.timestamp,
    this.imageUrl,
    this.countCM,
  });
  @override
  List<Object?> get props => [
        description,
        userName,
        pid,
        timestamp,
        userId,
        imageUrl,
        likes,
      ];

  Post copyWith(
      {String? description,
      String? pid,
      DateTime? timestamp,
      String? userId,
      String? imageUrl,
      String? userName,
      List? likes,
      String? countCM}) {
    return Post(
        description: description ?? this.description,
        pid: pid ?? this.pid,
        timestamp: timestamp ?? this.timestamp,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        imageUrl: imageUrl ?? this.imageUrl,
        likes: likes ?? this.likes,
        countCM: countCM ?? this.countCM);
  }

  PostModel toModel() => PostModel(
        userName: userName,
        description: description,
        pid: pid,
        userId: userId,
        timestamp: timestamp,
        imageUrl: imageUrl,
        likes: likes,
      );
}
