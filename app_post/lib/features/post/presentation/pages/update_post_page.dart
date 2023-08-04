// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_post/core/util/app_navigator.dart';
import 'package:app_post/core/util/route.dart';
import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UpdetePostPage extends StatelessWidget {
  final Post getData;

  const UpdetePostPage({super.key, required this.getData});
  @override
  Widget build(BuildContext context) {
    PostCubit postUpCubit = context.read<PostCubit>();
    postUpCubit.descipController.text = getData.description ?? '';

    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('Update'),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () async {
                      print(state.urlPhoto);
                      await postUpCubit.updatePost(Post(
                          userName: getData.userName,
                          userId: getData.userId,
                          imageUrl: state.urlPhoto,
                          pid: getData.pid,
                          description: postUpCubit.descipController.text,
                          datePublished: getData.datePublished));
                        
                      AppNavigator.pushAndRemoveUntil(AppRoute.nvbRoute);
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
                        hintText: 'Write a caption...',
                        border: OutlineInputBorder()),
                    maxLines: 3,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext _) {
                          return SimpleDialog(
                            title: const Text('Create a Post'),
                            children: <Widget>[
                              SimpleDialogOption(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Icon(Icons.camera_alt_rounded),
                                    Text('Take a photo'),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  postUpCubit.getImage(ImageSource.camera);
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
                                    postUpCubit.getImage(ImageSource.gallery);
                                  }),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
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
                    },
                    child: Text('Add Image'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  state.imageFile != null
                      ? Image.file(
                          (state.imageFile!),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        )
                      : getData.imageUrl != null
                          ? Image.network(
                              getData.imageUrl ?? '',
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
