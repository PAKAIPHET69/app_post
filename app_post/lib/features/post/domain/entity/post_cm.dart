import 'package:app_post/features/post/data/model/post_model.dart';
import 'package:equatable/equatable.dart';

class PostCM extends Equatable {
  final String? text;
  final String? commentId;
  final DateTime? timestamp;
  final String? uid;
  final String? name;

  const PostCM({
    this.text,
    this.commentId,
    this.timestamp,
    this.uid,
    this.name,
  });

  @override
  List<Object?> get props => [
        text,
        commentId,
        timestamp,
        uid,
        name,
      ];
  PostCMModel toModel() => PostCMModel(
        commentId: commentId,
        text: text,
        timestamp: timestamp,
        uid: uid,
        name: name,
      );
}
