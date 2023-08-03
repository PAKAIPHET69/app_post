import 'package:app_post/core/usecases/no_params.dart';
import 'package:app_post/core/util/app_navigator.dart';
import 'package:app_post/core/util/constant.dart';
import 'package:app_post/core/util/route.dart';
import 'package:app_post/features/signin/presentation/cubit/singin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/sigin_facebook_usecase.dart';
import '../../domain/usecases/sigin_google_usecase.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SigInGoogleUsecase sigInGoogleUsecase;
  final SigInfacebookUsecase sigInFacebookUsecase;

  SignInCubit(this.sigInGoogleUsecase, this.sigInFacebookUsecase)
      : super(const SignInState());

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final result = await sigInGoogleUsecase(NoParams());
    result.fold((error) {
      emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg));
    }, (user) {
      emit(state.copyWith(dataStatus: DataStatus.success, user: user));
      AppNavigator.pushAndRemoveUntil(AppRoute.nvbRoute);
    });
  }

  Future<void> signInWithFacebook() async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final result = await sigInFacebookUsecase(NoParams());
    result.fold((error) {
      emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg));
    }, (user) {
      emit(state.copyWith(dataStatus: DataStatus.success, user: user));
    });
  }
}
