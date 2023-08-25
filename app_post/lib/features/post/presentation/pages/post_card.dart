// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_post/core/util/app_navigator.dart';
import 'package:app_post/core/util/colors.dart';
import 'package:app_post/core/util/route.dart';
import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/domain/entity/post_cm.dart';
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
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.all(3),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 10,
                                            color: Colors.grey,
                                            offset: Offset(2, 2),
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding:
                                                EdgeInsetsDirectional.all(3),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 20,
                                                      child: Icon(
                                                        Icons.person,
                                                        size: 30,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            getPostUser
                                                                    .userName ??
                                                                '',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Plus Jakarta Sans',
                                                              color: Color(
                                                                  0xFF14181B),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          RichText(
                                                              text: TextSpan(
                                                            text: timeDate,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          )),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )),
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
                                                                            10),
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
                                            padding: EdgeInsetsDirectional.only(
                                                start: 5, end: 5, bottom: 5),
                                            child: Row(
                                              children: [
                                                Text(
                                                  getPostUser.description ?? '',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .only(start: 3, end: 3),
                                            child: getPostUser.imageUrl != ''
                                                ? Image.network(
                                                    getPostUser.imageUrl ?? '',
                                                    width: double.infinity,
                                                    height: 250,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Container(),
                                          ),
                                          Divider(thickness: 1),
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 5, end: 5),
                                            child: Row(
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
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(Icons
                                                          .mode_comment_outlined),
                                                      onPressed: () {
                                                        SendParam sendParam =
                                                            SendParam(
                                                                listToken:
                                                                    getPostUser
                                                                        .listTokens,
                                                                postId: getPostUser
                                                                        .pid ??
                                                                    '');
                                                        AppNavigator.navigateTo(
                                                            AppRoute
                                                                .commentRoute,
                                                            params: sendParam);
                                                      },
                                                    ),
                                                    getPostUser.countCM == "0"
                                                        ? Text('')
                                                        : Text(
                                                            ' ${getPostUser.countCM} comment',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Plus Jakarta Sans',
                                                              color: Color(
                                                                  0xFF57636C),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5),
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
