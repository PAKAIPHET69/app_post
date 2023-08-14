// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_post/core/util/app_navigator.dart';
import 'package:app_post/core/util/route.dart';
import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    PostCubit btnCubit = context.read<PostCubit>();

    return Scaffold(
        backgroundColor: Colors.black87,
        body: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.listPosts!.length,
              itemBuilder: (context, index) {
                final getPostUser = state.listPosts![index];
                final getCurrenteUser = state.currentUser!;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.96,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Colors.black38,
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 8, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Container(
                                      width: 40,
                                      height: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Colors.black26,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          getPostUser.userName ?? '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    getPostUser.userId == getCurrenteUser.uid
                                        ? IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return SimpleDialog(
                                                      children: <Widget>[
                                                        SimpleDialogOption(
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                FontAwesomeIcons
                                                                    .pen,
                                                                size: 20,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text('Update'),
                                                            ],
                                                          ),
                                                          onPressed: () {
                                                            Post sendData = Post(
                                                                description:
                                                                    getPostUser
                                                                        .description,
                                                                pid: getPostUser
                                                                    .pid,
                                                                userId:
                                                                    getPostUser
                                                                        .userId,
                                                                userName:
                                                                    getPostUser
                                                                        .userName,
                                                                timestamp:
                                                                    DateTime
                                                                        .now(),
                                                                imageUrl:
                                                                    getPostUser
                                                                        .imageUrl);
                                                            AppNavigator.navigateTo(
                                                                AppRoute
                                                                    .updatePostRoute,
                                                                params:
                                                                    sendData);
                                                          },
                                                        ),
                                                        Divider(
                                                          thickness: 1,
                                                          indent: 10,
                                                          endIndent: 10,
                                                        ),
                                                        SimpleDialogOption(
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.delete,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                'Delete',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                              ),
                                                            ],
                                                          ),
                                                          onPressed: () {
                                                            btnCubit.deletePost(
                                                                getPostUser
                                                                        .pid ??
                                                                    '');
                                                            AppNavigator
                                                                .goBack();
                                                          },
                                                        ),
                                                      ]);
                                                },
                                              );
                                            },
                                            icon: const Icon(Icons.more_vert),
                                          )
                                        : IconButton(
                                            icon: const Icon(Icons.more_vert),
                                            onPressed: () {},
                                          ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Text(
                                          getPostUser.description ?? '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                                child: getPostUser.imageUrl != null
                                    ? Image.network(
                                        getPostUser.imageUrl ?? '',
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(),
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: Color.fromARGB(255, 191, 190, 190),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.favorite_border),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                  Icons.mode_comment_outlined),
                                              onPressed: () {
                                                AppNavigator.navigateTo(
                                                    AppRoute.commentRoute,
                                                    params:
                                                        getPostUser.pid ?? '');
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
}
