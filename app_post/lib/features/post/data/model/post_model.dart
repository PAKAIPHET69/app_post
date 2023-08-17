import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/domain/entity/post_cm.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Post {
  const PostModel({
    String? description,
    String? pid,
    String? userId,
    DateTime? timestamp,
    String? imageUrl,
    String? userName,
    List? likes,
  }) : super(
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
class PostCMModel extends PostCM {
  const PostCMModel({
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
  factory PostCMModel.fromJson(Map<String, dynamic> json) =>
      _$PostCMModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostCMModelToJson(this);
}
