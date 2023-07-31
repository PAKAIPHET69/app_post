import 'package:app_post/core/util/colors.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/util/app_navigator.dart';
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
          return StreamBuilder(
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 3,
                      vertical: 15,
                    ),
                  );
                },
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
