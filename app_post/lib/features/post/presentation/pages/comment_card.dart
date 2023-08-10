// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black38,
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                // backgroundImage: NetworkImage(
                // ),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'name',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                                text: 'text_comment',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'time',
                          // DateFormat.yMMMd().format(
                          //   'datePublished',
                          // ),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
