import 'package:app_post/core/util/constant.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:equatable/equatable.dart';

class FollowState extends Equatable {
  final DataStatus? dataStatus;
  final String? error;
  final User? user;
  final User? currentUser;
  final String? follow;
  final List? followId;

  FollowState(
      {this.user, this.dataStatus, this.error, this.followId, this.follow, this.currentUser});

  @override
  List<Object?> get props => [dataStatus, error, user, followId, follow, currentUser];

  FollowState copyWith(
      {DataStatus? dataStatus,
      String? error,
      User? user,
      User? currentUser,
      List? followId,
      String? follow}) {
    return FollowState(
        dataStatus: dataStatus ?? this.dataStatus,
        error: error ?? this.error,
        user: user ?? this.user,
        currentUser: currentUser?? this.currentUser,
        followId: followId ?? this.followId,
        follow: follow ?? this.follow);
  }
}
