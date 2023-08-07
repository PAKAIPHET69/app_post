import 'package:app_post/core/util/constant.dart';
import 'package:app_post/features/search/domain/usecase/search_usecase.dart';
import 'package:app_post/features/search/persentitioon/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final SearchUsecse searchUsecse;
  final TextEditingController searchController = TextEditingController();

  SearchCubit(this.searchUsecse) : super(const SearchState());

  ///// Search User ////
  Future<void> getUser(String value) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final res = await searchUsecse(value);
    res.fold(
        (error) => emit(
            state.copyWith(dataStatus: DataStatus.failure, error: error.msg)),
        (users) => emit(
            state.copyWith(dataStatus: DataStatus.success, listUser: users)));
  }
}
