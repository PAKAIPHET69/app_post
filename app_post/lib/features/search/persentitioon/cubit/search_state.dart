import 'package:app_post/core/util/constant.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  final DataStatus? dataStatus;
  final String? error;
  final User? currentUser;
  final List<User>? listUser;

  const SearchState({
    this.listUser,
    this.currentUser,
    this.dataStatus,
    this.error,
  });

  @override
  List<Object?> get props => [currentUser, dataStatus, error, listUser];

  SearchState copyWith(
      {DataStatus? dataStatus,
      String? error,
      User? currentUser,
      List<User>? listUser}) {
    return SearchState(
        dataStatus: dataStatus ?? this.dataStatus,
        error: error ?? this.error,
        currentUser: currentUser ?? this.currentUser,
        listUser: listUser ?? this.listUser);
  }
}
