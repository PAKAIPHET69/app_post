// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
          if (state.dataStatus == DataStatus.initial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.listPosts?.length,
            itemBuilder: (context, index) {
              final userPost = state.listPosts?.elementAt(index);
              return SafeArea(
                // title: Text('${userPost?.description}'),
                // subtitle: Text('time:${userPost?.datePublished}'),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ).copyWith(right: 0),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 16,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "username${userPost?.userId}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('${userPost?.description}'),
                      GestureDetector(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: double.infinity,
                              // child: Image.network(
                              //   userPost.toString(),
                              //   fit: BoxFit.cover,
                              // )
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: const Icon(
                                Icons.favorite,
                              ),
                              onPressed: () {}),
                          IconButton(
                              icon: const Icon(
                                Icons.comment_outlined,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ],
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
              onPressed: () {},
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
}
