import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel(
      {String? uid,
      String? displayName,
      String? email,
      List? followers,
      List? following,
      List? tokenID})
      : super(
          tokenID: tokenID,
          displayName: displayName,
          uid: uid,
          email: email,
          followers: followers,
          following: following,
        );
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
