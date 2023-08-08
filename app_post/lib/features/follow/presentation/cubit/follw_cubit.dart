import 'package:app_post/core/util/constant.dart';
import 'package:app_post/features/follow/domain/usecases/follow_usease.dart';
import 'package:app_post/features/follow/presentation/cubit/follw_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowCubit extends Cubit<FollowState> {
  final FollowUsecase followUsecase;
  FollowCubit(this.followUsecase) : super(FollowState());

  Future<void> followUser(String uid, String followId) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final res = await followUsecase;
  }
}
