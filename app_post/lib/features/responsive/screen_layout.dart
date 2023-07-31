// ignore_for_file:, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app_post/features/responsive/cubit/layout_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/util/colors.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: PageView(),
          bottomNavigationBar: CupertinoTabBar(
            backgroundColor: mobileBackgroundColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color:
                      primaryColor, //(_page == 0) ? primaryColor : secondaryColor,
                ),
                label: '',
                backgroundColor: primaryColor,
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color:
                        primaryColor, //(_page == 1) ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_circle,
                    color:
                        primaryColor, //(_page == 2) ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color:
                      primaryColor, //(_page == 3) ? primaryColor : secondaryColor,
                ),
                label: '',
                backgroundColor: primaryColor,
              ),
            ],
            // onTap: navigationTapped,
            // currentIndex: _page,
          ),
        );
      },
    );
  }
}
