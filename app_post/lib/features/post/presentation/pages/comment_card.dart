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
        return Scaffold(
          body: ListView.builder(
              // itemCount: state.listPostCM!.length,
              itemBuilder: (context, index) {
            // final getPostComments = state.listPostCM![index];
            // final a = state.listPostCM!.length;
            // print(a);
            return Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: ListTile(
                trailing: PopupMenuButton(
                  itemBuilder: (context) =>
                      [PopupMenuItem(child: Text('Delete'))],
                ),
                leading: CircleAvatar(child: Icon(Icons.person)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Name',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('data'),
                  ],
                ),
              ),
            );

            // return Container(
            //   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            //   child: Row(
            //     children: [
            //       CircleAvatar(
            //         backgroundImage: AssetImage('assets/images/logo.png'),
            //         backgroundColor: Colors.black,
            //         radius: 18,
            //       ),
            //       Expanded(
            //           child: Padding(
            //               padding: const EdgeInsets.only(left: 16),
            //               child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     RichText(
            //                       text: TextSpan(
            //                         children: [
            //                           TextSpan(
            //                               text: 'Name',
            //                               style: const TextStyle(
            //                                 color: Colors.black,
            //                                 fontWeight: FontWeight.bold,
            //                               )),
            //                           TextSpan(
            //                               text: 'text_comment',
            //                               style:
            //                                   TextStyle(color: Colors.black)),
            //                         ],
            //                       ),
            //                     ),
            //                     Padding(
            //                         padding: const EdgeInsets.only(top: 4),
            //                         child: Text('time',
            //                             style: const TextStyle(
            //                                 fontSize: 12,
            //                                 fontWeight: FontWeight.w400))),
            //                   ]))),
            //       Container(
            //           padding: const EdgeInsets.all(8),
            //           child: IconButton(
            //             icon: const Icon(Icons.more_horiz),
            //             onPressed: () {},
            //           ))
            //     ],
            //   ),
            // );
          }),
        );
      },
    );
  }
}
