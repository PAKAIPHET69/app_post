// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_post/features/signin/presentation/cubit/singin_state.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/constant.dart';
import '../cubit/singin_cubit.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SignInCubit, SignInState>(builder: (context, state) {
          if (state.dataStatus == DataStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 350,
                child: Image.asset('assets/images/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                    child: Column(
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Sign in with your Google or Facebook account.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          icon: Icon(FontAwesomeIcons.google),
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red,
                              minimumSize: const Size(300, 50)),
                          label: Text(
                            'Sign up with Google',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 24),
                          ),
                          onPressed: () {
                            context.read<SignInCubit>().signInWithGoogle();
                          },
                        ),
                        Divider(thickness: 1),
                        ElevatedButton.icon(
                            onPressed: () {
                              context.read<SignInCubit>().signInWithFacebook();
                            },
                            icon: Icon(FontAwesomeIcons.facebook),
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.blue,
                                backgroundColor: Colors.white,
                                minimumSize: const Size(300, 50)),
                            label: Text(
                              'Sign up with FaceBook',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 24),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                color: Color(0xFF161C24),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Color(0xFF2797FF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
