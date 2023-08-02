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
          return ListView.builder(
            itemCount: state.listPosts!.length,
            itemBuilder: (context, index) {
              final showPost = state.listPosts![index];
              return Container(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5,
                          ).copyWith(right: 0),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 18,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        showPost.userName ?? '',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // Text(showPost.datePublished??),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _dialogBuilder(context);
                                },
                                icon: const Icon(Icons.more_vert),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            showPost.description ?? '',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ),
                        GestureDetector(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              showPost.imageUrl != null
                                  ? SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.35,
                                      width: double.infinity,
                                      child: Image.network(
                                        showPost.imageUrl ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                        SizedBox(
                          child: ColoredBox(
                              color: Color.fromARGB(255, 210, 209, 209)),
                          height: 2,
                          width: 1000,
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                                icon: const Icon(
                                  Icons.favorite_border,
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: const Icon(
                                  Icons.comment_outlined,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                        SizedBox(
                          child: ColoredBox(
                              color: Color.fromARGB(255, 210, 209, 209)),
                          height: 2,
                          width: 1000,
                        ),
                      ],
                    ),
                  ),
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
                  AppNavigator.navigateTo(AppRoute.postRoute);
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

  //show popup dialog
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      useRootNavigator: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shrinkWrap: true,
              children: [
                'Delete',
              ]
                  .map(
                    (e) => InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: Text(e),
                        ),
                        onTap: () {
                          // context.read<PostCubit>().deletePost();
                          // AppNavigator.goBack();
                        }),
                  )
                  .toList()),
        );
      },
    );
  }
}
