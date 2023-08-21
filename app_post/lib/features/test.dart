import 'package:app_post/core/service/service_local_notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

class TestSearch extends StatefulWidget {
  const TestSearch({super.key});

  @override
  State<TestSearch> createState() => _TestSearchState();
}

class _TestSearchState extends State<TestSearch> {
  final follow = FirebaseFirestore.instance
      .collection('testss')
      .doc('test')
      .collection('part')
      .count()
      .get();
  final token = FirebaseInstallations.instance.getToken();

  final lastestMessage = FirebaseFirestore.instance
      .collection('testss')
      .doc('test')
      .collection('msg')
      .orderBy('timestamp', descending: true)
      .limit(1)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    print('print $follow');
    print(token);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.yellow.shade800],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text('test'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: lastestMessage,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }

          print(lastestMessage);
          final filteredData =
              snapshot.data!.docs.toList().map((e) => e.data() as Map).toList();
          return Column(
            children: [
              TextButton(
                  onPressed: () async {
                    final localNotificationService = LocalNotificationService();
                    localNotificationService.sendLocalNotification(
                        'Message', 'Helloworld');
                  },
                  child: Text('Click Me'))
            ],
          );
        },
      ),
    );
  }
}
