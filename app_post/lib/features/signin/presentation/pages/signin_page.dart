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
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
          child:
              BlocBuilder<SignInCubit, SignInState>(builder: (context, state) {
            if (state.dataStatus == DataStatus.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey,
                        width: 0,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Sign in with your Google or Facebook account.',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color(0xFF636F81),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.red,
                                  minimumSize: const Size(double.infinity, 50)),
                              onPressed: () {
                                context.read<SignInCubit>().signInWithGoogle();
                              },
                              child: Row(
                                children: [
                                  const Icon(FontAwesomeIcons.google),
                                  const SizedBox(width: 15),
                                  const Text(
                                    'Continue with Google',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue,
                                  minimumSize: const Size(double.infinity, 50)),
                              onPressed: () {
                                context
                                    .read<SignInCubit>()
                                    .signInWithFacebook();
                              },
                              child: Row(
                                children: [
                                  const Icon(FontAwesomeIcons.facebook),
                                  const SizedBox(width: 15),
                                  const Text(
                                    'Continue with Facebook',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
