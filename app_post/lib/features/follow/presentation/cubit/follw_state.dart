import 'package:app_post/core/util/constant.dart';
import 'package:equatable/equatable.dart';

class FollowState extends Equatable {
  final DataStatus? dataStatus;
  final String? error;

  FollowState({this.dataStatus, this.error});

  @override
  List<Object?> get props => [dataStatus, error];

  FollowState copyWith({
    DataStatus? dataStatus,
    String? error,
  }) {
    return FollowState(
      dataStatus: dataStatus ?? this.dataStatus,
      error: error ?? this.error,
    );
  }
}
