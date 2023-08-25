import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/domain/entity/post_cm.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Post {
  const PostModel(
      {String? description,
      String? pid,
      String? userId,
      DateTime? timestamp,
      String? imageUrl,
      String? userName,
      List? likes,
      List<String>? listTokens,
      List<String>? following})
      : super(
          listTokens: listTokens,
          following: following,
          likes: likes,
          userName: userName,
          timestamp: timestamp,
          pid: pid,
          userId: userId,
          description: description,
          imageUrl: imageUrl,
        );
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}

@JsonSerializable()
class CommentModel extends Comment {
  const CommentModel({
    String? text,
    String? commentId,
    DateTime? timestamp,
    String? uid,
    String? name,
  }) : super(
            text: text,
            commentId: commentId,
            timestamp: timestamp,
            uid: uid,
            name: name);
  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
