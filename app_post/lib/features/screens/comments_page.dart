// ignore_for_file: prefer_const_constructors

import 'package:app_post/core/util/colors.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:app_post/features/post/presentation/pages/comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        final getUser = state.currentUser!;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appbarColor,
            title: const Text(
              'Comments',
            ),
            centerTitle: false,
          ),
          body: CommentCard(),
          bottomNavigationBar: SafeArea(
            child: Container(
              color: Colors.white,
              height: kToolbarHeight,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    // backgroundImage: ,
                    backgroundColor: Colors.amber,
                    radius: 18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 8),
                      child: TextField(
                        // controller: commentEditingController,
                        decoration: InputDecoration(
                          hintText: 'Comment as ${getUser.displayName ?? ''}',
                          focusColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    // => postComment(
                    //   user.uid,
                    //   user.username,
                    //   user.photoUrl,
                    // ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Post',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
