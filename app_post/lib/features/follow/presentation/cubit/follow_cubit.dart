import 'package:app_post/core/util/constant.dart';
import 'package:app_post/features/follow/domain/usecases/follow_usease.dart';
import 'package:app_post/features/follow/presentation/cubit/follow_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowCubit extends Cubit<FollowState> {
  final FollowUsecase followUsecase;
  FollowCubit(this.followUsecase) : super(FollowState());

  Future<void> followUser(
      {required String uid, required String followId}) async {
    final res = await followUsecase(followId);
    res.fold((error) {
      emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg));
    }, (follow) {
      emit(state.copyWith(dataStatus: DataStatus.success));
    });
  }
}
