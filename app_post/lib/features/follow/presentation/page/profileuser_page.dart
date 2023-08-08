// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:app_post/core/util/colors.dart';
import 'package:app_post/core/widgets/follow_button.dart';
import 'package:app_post/features/follow/presentation/cubit/follow_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUserPage extends StatelessWidget {
  final String getDisplayName;
  ProfileUserPage({
    super.key,
    required this.getDisplayName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appbarColor,
            title: Text(getDisplayName),
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
                              backgroundColor: Colors.black,
                              // backgroundImage: NetworkImage(),
                              radius: 40,
                            ),
                            Text(
                              getDisplayName,
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                                  // Column(
                                  //   children: [
                                  //     Text(
                                  //       'Post',
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold),
                                  //     ),
                                  //     Text('999')
                                  //   ],
                                  // ),
                                  Column(
                                    children: [
                                      Text(
                                        'Follow',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('999')
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Following',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('999')
                                    ],
                                  )
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
                          FollowButton(
                            text: 'Follow',
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            borderColor: Colors.grey,
                            function: () {
                              context.read<FollowCubit>();
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
