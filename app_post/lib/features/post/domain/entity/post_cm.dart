import 'package:app_post/features/post/data/model/post_model.dart';
import 'package:equatable/equatable.dart';

class PostCM extends Equatable {
  final String? text;
  final String? commentId;
  final DateTime? timestamp;
  final String? uid;
  final String? name;
  final List<String>? viewCM;

  const PostCM({
    this.viewCM,
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
  PostCM copyWith({
    List<String>? viewCM,
    String? text,
    String? commentId,
    DateTime? timestamp,
    String? uid,
    String? name,
  }) {
    return PostCM(
        viewCM: viewCM ?? this.viewCM,
        text: text ?? this.text,
        commentId: commentId ?? this.commentId,
        timestamp: timestamp ?? this.timestamp,
        uid: uid ?? this.uid,
        name: name ?? this.name);
  }

  PostCMModel toModel() => PostCMModel(
        commentId: commentId,
        text: text,
        timestamp: timestamp,
        uid: uid,
        name: name,
      );
}
