// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_post/core/util/constant.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  get image => null;

  @override
  Widget build(BuildContext context) {
    PostCubit postUpCubit = context.read<PostCubit>();
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state.dataStatus == DataStatus.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('Post to'),
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
                      'Post',
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
                    onPressed: () {
                      _dialogBuilder(context);
                    },
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

  //show popup dialog
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext _) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(Icons.camera),
                  Text('Take a photo'),
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
                context.read<PostCubit>().getImage(ImageSource.camera);
              },
            ),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(Icons.image),
                    Text('From Gallery'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  context.read<PostCubit>().getImage(ImageSource.gallery);
                }),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
