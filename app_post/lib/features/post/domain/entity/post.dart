import 'package:app_post/features/post/data/model/post_model.dart';
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String? description;
  final String? pid;
  final DateTime? datePublished;
  final String? userId;
  final String? imageUrl;

  const Post({
    this.userId,
    this.description,
    this.pid,
    this.datePublished,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
        description,
        pid,
        datePublished,
        userId,
        imageUrl,
      ];

  get length => null;

  PostModel toModel() => PostModel(
        description: description,
        pid: pid,
        userId: userId,
        datePublished: datePublished,
        imageUrl: imageUrl,
      );

  elementAt(int index) {}
}
