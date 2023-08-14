// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:app_post/core/util/colors.dart';
import 'package:app_post/core/util/constant.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:app_post/features/post/presentation/pages/comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentPage extends StatelessWidget {
  final String getPostData;
  CommentPage({super.key, required this.getPostData});
  @override
  Widget build(BuildContext context) {
    PostCubit postCubit = context.read<PostCubit>();
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
          body: state.dataStatus == DataStatus.loading
              ? Container()
              : CommentCard(
                  getPid: getPostData,
                ), //List Post comment
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
                    backgroundImage: AssetImage('assets/images/logo.png'),
                    backgroundColor: Colors.grey,
                    radius: 18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 8),
                      child: TextField(
                        controller: postCubit.textController,
                        decoration: InputDecoration(
                          hintText: 'Comment as ${getUser.displayName ?? ''}',
                          focusColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: TextButton(
                        onPressed: () {
                          postCubit.postComment(
                              postId: getPostData,
                              text: postCubit.textController.text);
                        },
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
