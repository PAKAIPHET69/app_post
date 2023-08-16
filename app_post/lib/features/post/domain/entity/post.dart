import 'package:app_post/features/post/data/model/post_model.dart';
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String? description;
  final String? pid;
  final DateTime? timestamp;
  final String? userId;
  final String? imageUrl;
  final String? userName;
  final List? linke;
  final String? countCM;

  const Post({
    this.linke,
    this.countCM,
    this.userName,
    this.userId,
    this.description,
    this.pid,
    this.timestamp,
    this.imageUrl,
  });
  @override
  List<Object?> get props =>
      [description, userName, pid, timestamp, userId, imageUrl, countCM, linke];

  Post copyWith(
      {String? description,
      String? pid,
      DateTime? timestamp,
      String? userId,
      String? imageUrl,
      String? userName,
      List? linke,
      String? countCM}) {
    return Post(
        description: description ?? this.description,
        pid: pid ?? this.pid,
        timestamp: timestamp ?? this.timestamp,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        countCM: countCM ?? this.countCM,
        imageUrl: imageUrl ?? this.imageUrl,
        linke: linke ?? this.linke);
  }

  PostModel toModel() => PostModel(
        userName: userName,
        description: description,
        pid: pid,
        userId: userId,
        timestamp: timestamp,
        imageUrl: imageUrl,
        countCM: countCM,
        linke: linke,
      );
}
