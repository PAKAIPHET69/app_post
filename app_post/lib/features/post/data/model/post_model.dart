import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Post {
  const PostModel({
    String? description,
    String? pid,
    String? userId,
    DateTime? datePublished,
    String? imageUrl,
    String? userName,
  }) : super(
          userName: userName,
          datePublished: datePublished,
          pid: pid,
          userId: userId,
          description: description,
          imageUrl: imageUrl,
        );
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
