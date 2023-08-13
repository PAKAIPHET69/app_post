import 'package:equatable/equatable.dart';

import '../../../../core/util/constant.dart';
import '../../domain/entity/user.dart';

class SignInState extends Equatable {
  final DataStatus? dataStatus;
  final String? error;
  final User? user;

  const SignInState({
    this.dataStatus,
    this.error,
    this.user,
  });

  @override
  List<Object?> get props => [
        dataStatus,
        error,
        user,
      ];
  SignInState copyWith({
    List<User>? listLogin,
    DataStatus? dataStatus,
    String? error,
    User? user,
  }) {
    return SignInState(
      dataStatus: dataStatus ?? this.dataStatus,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }
}
