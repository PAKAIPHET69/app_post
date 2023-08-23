// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      description: json['description'] as String?,
      pid: json['pid'] as String?,
      userId: json['userId'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      imageUrl: json['imageUrl'] as String?,
      userName: json['userName'] as String?,
      likes: json['likes'] as List<dynamic>?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'description': instance.description,
      'pid': instance.pid,
      'timestamp': instance.timestamp?.toIso8601String(),
      'userId': instance.userId,
      'imageUrl': instance.imageUrl,
      'userName': instance.userName,
      'likes': instance.likes,
    };

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      text: json['text'] as String?,
      commentId: json['commentId'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'commentId': instance.commentId,
      'timestamp': instance.timestamp?.toIso8601String(),
      'uid': instance.uid,
      'name': instance.name,
    };
