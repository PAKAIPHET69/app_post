// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last

import 'package:app_post/core/util/colors.dart';
import 'package:app_post/core/util/constant.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUserPage extends StatelessWidget {
  final User getDataUser;
  ProfileUserPage({
    super.key,
    required this.getDataUser,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state.dataStatus == DataStatus.loading) {
          return Container();
        }

        final getCurrentUser = state.currentUser!;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: appbarColor,
            title: Text(getDataUser.displayName ?? ''),
          ),
          body: ListView.builder(
            itemCount: state.listUser!.length,
            itemBuilder: (BuildContext context, index) {
              final res = state.listUser![index];
              return Padding(
                padding: EdgeInsetsDirectional.only(top: 10),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person, size: 35),
                      backgroundColor: Colors.black,
                      radius: 40,
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(children: [
                                    Text('Followers',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text(res.followers!.length.toString(),
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ]),
                                  Column(children: [
                                    Text('Following',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text(res.following!.length.toString(),
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ])
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    getCurrentUser.uid == getDataUser.uid
                        ? Container()
                        : res.followers!.contains(getCurrentUser.uid)
                            ? TextButton(
                                onPressed: () {
                                  context.read<PostCubit>().followUser(
                                      uid: getCurrentUser.uid ?? '',
                                      followId: getDataUser.uid ?? '');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.center,
                                  width: 200,
                                  height: 40,
                                  child: Text(
                                    'Unfollow',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : TextButton(
                                onPressed: () {
                                  context.read<PostCubit>().followUser(
                                      uid: getCurrentUser.uid ?? '',
                                      followId: getDataUser.uid ?? '');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.center,
                                  width: 200,
                                  height: 40,
                                  child: Text(
                                    'Follow',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
