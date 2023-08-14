// ignore_for_file: prefer_const_constructors

import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        return Scaffold(
            body: ListView.builder(
          itemCount: state.listPostCM!.length,
          itemBuilder: (context, index) {
            final postComment = state.listPostCM![index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: ListTile(
                trailing: PopupMenuButton(
                  itemBuilder: (context) =>
                      [PopupMenuItem(child: Text('Delete'))],
                ),
                leading: CircleAvatar(child: Icon(Icons.person)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      postComment.name ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      postComment.text ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
      },
    );
  }
}
