// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last

import 'package:app_post/core/util/colors.dart';
import 'package:app_post/features/follow/presentation/cubit/follow_cubit.dart';
import 'package:app_post/features/follow/presentation/cubit/follow_state.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUserPage extends StatelessWidget {
  final User getDataUser;
  final bool isFollowing = false;
  ProfileUserPage({
    super.key,
    required this.getDataUser,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowCubit, FollowState>(
      builder: (context, state) {
        final isFollowing = getDataUser.uid;
        final getCurrentUser = state.currentUser!;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appbarColor,
            title: Text(getDataUser.displayName ?? ''),
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              child: Icon(
                                Icons.person,
                                size: 35,
                              ),
                              backgroundColor: Colors.black,
                              // backgroundImage: NetworkImage(),
                              radius: 40,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(children: [
                                    Text(
                                      'Followers',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('0',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ]),
                                  Column(children: [
                                    Text(
                                      'Following',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('0',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ])
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(125, 0, 0, 0),
                      child: Column(
                        children: [
                          getCurrentUser.uid == getDataUser.uid
                              ? Container()
                              : isFollowing != getCurrentUser.uid
                                  ? TextButton(
                                      onPressed: () {
                                        context.read<FollowCubit>().followUser(
                                            uid: getCurrentUser.uid ?? '',
                                            followId: getDataUser.uid ?? '');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        alignment: Alignment.center,
                                        width: 200,
                                        height: 30,
                                        child: Text(
                                          'Follow',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  : TextButton(
                                      onPressed: () {
                                        context.read<FollowCubit>().followUser(
                                            uid: getCurrentUser.uid ?? '',
                                            followId: getDataUser.uid ?? '');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        alignment: Alignment.center,
                                        width: 200,
                                        height: 30,
                                        child: Text(
                                          'Unfollow',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}
