// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.symmetric(vertical: 10),
          );
        },
      ),
    );
  }
}
 