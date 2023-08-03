// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_unnecessary_containers

import 'package:app_post/core/util/colors.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/util/app_navigator.dart';
import '../../core/util/constant.dart';
import '../../core/util/route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 80,
          ),
        ),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state.dataStatus == DataStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          PostCubit postUpCubit = context.read<PostCubit>();

          return ListView.builder(
            itemCount: state.listPosts!.length,
            itemBuilder: (context, index) {
              final userPost = state.listPosts![index];
              final userID = state.currentUser!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.96,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color.fromARGB(255, 255, 255, 255),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        //
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
                                    // child: Image.asset(
                                    //   '',
                                    // ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Text(
                                        userPost.userName ?? '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  userPost.userId == userID.uid
                                      ? IconButton(
                                          onPressed: () {
                                            // showModalBottomSheet<void>(
                                            //     context: context,
                                            //     builder:
                                            //         (BuildContext context) {
                                            //       return SizedBox(
                                            //         height: 150,
                                            //         child: Center(
                                            //           child: Column(
                                            //             mainAxisAlignment:
                                            //                 MainAxisAlignment
                                            //                     .center,
                                            //             mainAxisSize:
                                            //                 MainAxisSize.min,
                                            //             children: <Widget>[
                                            //               const Text(
                                            //                   'Modal BottomSheet'),
                                            //               ElevatedButton(
                                            //                 child: const Text(
                                            //                     'Close BottomSheet'),
                                            //                 onPressed: () =>
                                            //                     Navigator.pop(
                                            //                         context),
                                            //               ),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       );
                                            //     });
                                            showDialog(
                                              useRootNavigator: false,
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  child: ListView(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 16),
                                                      shrinkWrap: true,
                                                      children: [
                                                        'Delete',
                                                      ]
                                                          .map(
                                                            (e) => InkWell(
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          12,
                                                                      horizontal:
                                                                          16),
                                                                  child:
                                                                      Text(e),
                                                                ),
                                                                onTap: () {
                                                                  postUpCubit
                                                                      .delePost(
                                                                          userPost.pid ??
                                                                              '');
                                                                  AppNavigator
                                                                      .goBack();
                                                                }),
                                                          )
                                                          .toList()),
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(Icons.more_vert),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: Text(
                                        userPost.description ?? '',
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
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: userPost.imageUrl != null
                                  ? Image.network(
                                      userPost.imageUrl ?? '',
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 200,
                                      fit: BoxFit.fitWidth,
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
                                          Icon(
                                            Icons.mode_comment_outlined,
                                            size: 24,
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
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              color: Colors.grey,
              icon: const Icon(
                Icons.home,
              ),
              onPressed: () {
                AppNavigator.pushAndRemoveUntil(AppRoute.homeRoute);
              },
            ),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                color: Colors.grey,
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: () {
                  AppNavigator.navigateTo(AppRoute.searchRoute);
                },
              ),
              label: '',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: IconButton(
                color: Colors.grey,
                icon: const Icon(
                  Icons.add_circle,
                ),
                onPressed: () {
                  AppNavigator.navigateTo(AppRoute.addPostRoute);
                },
              ),
              label: '',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: IconButton(
              color: Colors.grey,
              icon: const Icon(
                Icons.person,
              ),
              onPressed: () {
                AppNavigator.navigateTo(AppRoute.profileRoute);
              },
            ),
            label: '',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
