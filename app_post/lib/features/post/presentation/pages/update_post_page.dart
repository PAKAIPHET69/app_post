// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdetePostPage extends StatelessWidget {
  const UpdetePostPage({super.key});
  @override
  Widget build(BuildContext context) {
    PostCubit postUpCubit = context.read<PostCubit>();

    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        // final detailPost = state.listPosts!.length;
        // final userID = state.currentUser!;
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('Update'),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      context
                          .read<PostCubit>()
                          .postUp(postUpCubit.descipController.text);
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ),
                ),
              ]),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: postUpCubit.descipController,
                    decoration: InputDecoration(
                        hintText: "Write a caption...",
                        border: InputBorder.none),
                    maxLines: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Add Image'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  state.imageFile != null
                      ? Image.file(
                          (state.imageFile!),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        )
                      : Container()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
