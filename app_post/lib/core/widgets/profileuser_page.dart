// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_post/core/util/colors.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUserPage extends StatelessWidget {
  final String getDisplayName;
  const ProfileUserPage({super.key, required this.getDisplayName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        final profileUser = state.listPosts;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: appbarColor,
            title: Text(''),
            actions: [
              Icon(
                Icons.settings,
              ),
            ],
          ),
          body: ListView.builder(
              itemCount: profileUser?.length,
              itemBuilder: (context, index) {
                return Container();
              }),
        );
      },
    );
  }
}
