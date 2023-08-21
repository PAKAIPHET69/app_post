// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_post/core/util/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: Text('Profile Page'),
        actions: [
          Icon(
            Icons.settings,
          ),
        ],
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
                          'name',
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Post',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('999')
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Follow',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('999')
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Following',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                  child: Column(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
