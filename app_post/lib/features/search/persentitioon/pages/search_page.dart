// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_post/core/util/app_navigator.dart';
import 'package:app_post/core/util/colors.dart';
import 'package:app_post/core/util/route.dart';
import 'package:app_post/features/search/persentitioon/cubit/search_cubit.dart';
import 'package:app_post/features/search/persentitioon/cubit/search_state.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = context.read<SearchCubit>();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final searchResults = state.listUser;
        final getCurrenteUser = state.currentUser;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appbarColor,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: TextField(
                controller: searchCubit.searchController,
                onChanged: (value) {
                  searchCubit.getUser(value);
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: searchResults?.length,
            itemBuilder: (context, index) {
              final listUser = searchResults?[index];
              return InkWell(
                onTap: () {
                  User sendParams = User(
                      uid: listUser?.uid ?? '',
                      displayName: listUser?.displayName ?? '');
                  AppNavigator.navigateTo(AppRoute.profileUserRoute,
                      params: sendParams);
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 18,
                  ),
                  title: Text(
                    listUser?.displayName ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
