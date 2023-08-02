// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      description: json['description'] as String?,
      pid: json['pid'] as String?,
      userId: json['userId'] as String?,
      datePublished: json['datePublished'] == null
          ? null
          : DateTime.parse(json['datePublished'] as String),
      imageUrl: json['imageUrl'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'description': instance.description,
      'pid': instance.pid,
      'datePublished': instance.datePublished?.toIso8601String(),
      'userId': instance.userId,
      'imageUrl': instance.imageUrl,
      'userName': instance.userName,
    };
