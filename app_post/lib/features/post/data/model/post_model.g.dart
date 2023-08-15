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
      countCM: json['countCM'] as String?,
      linke: json['linke'] as List<dynamic>?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'description': instance.description,
      'pid': instance.pid,
      'timestamp': instance.timestamp?.toIso8601String(),
      'userId': instance.userId,
      'imageUrl': instance.imageUrl,
      'userName': instance.userName,
      'linke': instance.linke,
      'countCM': instance.countCM,
    };

PostCMModel _$PostCMModelFromJson(Map<String, dynamic> json) => PostCMModel(
      text: json['text'] as String?,
      commentId: json['commentId'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PostCMModelToJson(PostCMModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'commentId': instance.commentId,
      'timestamp': instance.timestamp?.toIso8601String(),
      'uid': instance.uid,
      'name': instance.name,
    };
