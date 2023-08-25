// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_post/core/util/colors.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        // final getcurrentUser = state.currentUser;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appbarColor,
            title: Text('Profile',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                )),
            // actions: [
            //   Icon(
            //     Icons.settings,
            //   ),
            // ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person, size: 50),
                ),
              ),
              Text(
                state.currentUser?.displayName ?? '',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF15161E),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                state.currentUser?.email ?? '',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  color: Color(0xFF606A85),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color(0xFF15161E),
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF606A85),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                    Column(
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color(0xFF15161E),
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Following',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF606A85),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Log out',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
              Divider(thickness: 1, indent: 15, endIndent: 15)
            ],
          ),
        );
      },
    );
  }
}
