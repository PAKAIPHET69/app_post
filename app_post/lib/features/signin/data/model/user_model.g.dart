// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String?,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      followers: json['followers'] as List<dynamic>?,
      following: (json['following'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tokenID: json['tokenID'] as List<dynamic>?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'email': instance.email,
      'followers': instance.followers,
      'following': instance.following,
      'tokenID': instance.tokenID,
    };
