import 'package:app_post/core/usecases/no_params.dart';
import 'package:app_post/core/util/constant.dart';
import 'package:app_post/features/follow/domain/usecases/follow_usease.dart';
import 'package:app_post/features/follow/domain/usecases/get_currentuser.dart';
import 'package:app_post/features/follow/presentation/cubit/follow_state.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FollowCubit extends Cubit<FollowState> {
  final FollowUsecase followUsecase;
  final GetCurrentUser getCurrentUserUsecase;

  FollowCubit(this.followUsecase, this.getCurrentUserUsecase)
      : super(FollowState());

  Future<void> followUser(
      {required String uid, required String followId}) async {
    final res = await followUsecase(User(uid: uid, followId: followId));
    res.fold((error) {
      emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg));
    }, (follow) {
      emit(state.copyWith(dataStatus: DataStatus.success));
    });
  }

  void getCurrentUser() {
    emit(state.copyWith(
      dataStatus: DataStatus.loading,
    ));
    final res = getCurrentUserUsecase(NoParams());
    emit(state.copyWith(
      dataStatus: DataStatus.success,
      currentUser: res,
    ));
  }
}
