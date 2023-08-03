// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            // borderColor: Colors.transparent,
            // borderRadius: 30,
            // borderWidth: 1,
            // buttonSize: 50,
            icon: Icon(
              Icons.home_rounded,
              color: Color(0xFF9299A1),
              size: 24,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          IconButton(
            // borderColor: Colors.transparent,
            // borderRadius: 30,
            // borderWidth: 1,
            // buttonSize: 50,
            icon: Icon(
              Icons.chat_bubble_rounded,
              color: Color(0xFF9299A1),
              size: 24,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: IconButton(
                  // borderColor: Colors.transparent,
                  // borderRadius: 25,
                  // borderWidth: 1,
                  // buttonSize: 60,
                  // fillColor: FlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    print('MiddleButton pressed ...');
                  },
                ),
              ),
            ],
          ),
          IconButton(
            // borderColor: Colors.transparent,
            // borderRadius: 30,
            // borderWidth: 1,
            // buttonSize: 50,
            icon: Icon(
              Icons.favorite_rounded,
              color: Color(0xFF9299A1),
              size: 24,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          IconButton(
            // borderColor: Colors.transparent,
            // borderRadius: 30,
            // borderWidth: 1,
            // buttonSize: 50,
            icon: Icon(
              Icons.person,
              color: Color(0xFF9299A1),
              size: 24,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ],
      ),
      Material(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Color(0x1A57636C),
                offset: Offset(0, -10),
                spreadRadius: 0.1,
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
      )
    ]);
  }
}
