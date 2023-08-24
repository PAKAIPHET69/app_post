// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_post/core/util/app_navigator.dart';
import 'package:app_post/core/util/colors.dart';
import 'package:app_post/core/util/route.dart';
import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    PostCubit btnCubit = context.read<PostCubit>();

    return Scaffold(
        backgroundColor: primaryColor,
        body: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            return state.listPosts == null
                ? Container()
                : ListView.builder(
                    itemCount: state.listPosts!.length,
                    itemBuilder: (context, index) {
                      final getPostUser = state.listPosts![index];
                      final currenteUser = state.currentUser!;
                      final timeDate = DateFormat('EE dd/MM/yy')
                          .format(getPostUser.timestamp!);
                      return getPostUser.userId == currenteUser.uid ||
                              getPostUser.followers!.contains(currenteUser.uid)
                          ? SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.96,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 10,
                                            color: Colors.grey,
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                CircleAvatar(
                                                  child: Icon(Icons.person),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 0, 0, 0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          getPostUser
                                                                  .userName ??
                                                              '',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16),
                                                        ),
                                                        SizedBox(width: 5),
                                                        Text(timeDate)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                getPostUser.userId ==
                                                        currenteUser.uid
                                                    ? IconButton(
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return SimpleDialog(
                                                                  children: <Widget>[
                                                                    SimpleDialogOption(
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Icon(
                                                                            FontAwesomeIcons.pen,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                              'Update'),
                                                                        ],
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        Post sendData = Post(
                                                                            description:
                                                                                getPostUser.description,
                                                                            pid: getPostUser.pid,
                                                                            userId: getPostUser.userId,
                                                                            userName: getPostUser.userName,
                                                                            timestamp: DateTime.now(),
                                                                            imageUrl: getPostUser.imageUrl);
                                                                        AppNavigator.navigateTo(
                                                                            AppRoute
                                                                                .updatePostRoute,
                                                                            params:
                                                                                sendData);
                                                                      },
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          1,
                                                                      indent:
                                                                          10,
                                                                      endIndent:
                                                                          10,
                                                                    ),
                                                                    SimpleDialogOption(
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Icon(
                                                                            Icons.delete,
                                                                            color:
                                                                                Colors.red,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            'Delete',
                                                                            style:
                                                                                TextStyle(color: Colors.red),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        btnCubit.deletePost(getPostUser.pid ??
                                                                            '');
                                                                        AppNavigator
                                                                            .goBack();
                                                                      },
                                                                    ),
                                                                  ]);
                                                            },
                                                          );
                                                        },
                                                        icon: const Icon(
                                                            Icons.more_vert),
                                                      )
                                                    : IconButton(
                                                        icon: const Icon(
                                                            Icons.more_vert),
                                                        onPressed: () {},
                                                      ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 5, 10, 5),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    getPostUser.description ??
                                                        '',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
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
                                                    width: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    height: 450,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Container(),
                                          ),
                                          Divider(
                                              height: 0,
                                              thickness: 1,
                                              indent: 5,
                                              endIndent: 5,
                                              color: Colors.grey),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      icon: getPostUser.likes!
                                                              .contains(
                                                                  currenteUser
                                                                      .uid)
                                                          ? const Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                            )
                                                          : const Icon(
                                                              Icons.favorite,
                                                            ),
                                                      onPressed: () {
                                                        btnCubit.likesPost(
                                                            postId: getPostUser
                                                                    .pid ??
                                                                '');
                                                      },
                                                    ),
                                                    IconButton(
                                                      icon: Icon(Icons.chat),
                                                      onPressed: () {
                                                        AppNavigator.navigateTo(
                                                            AppRoute
                                                                .commentRoute,
                                                            params: getPostUser
                                                                    .pid ??
                                                                '');
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                getPostUser.countCM == "0"
                                                    ? Text('')
                                                    : Text(
                                                        'View all ${getPostUser.countCM} comments',
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container();
                    },
                  );
          },
        ));
  }
}
