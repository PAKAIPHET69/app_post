import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../signin/data/model/user_model.dart';

abstract class SearchRemoteDatasource {
  Future<List<UserModel>> getlistUser({required String username});
}

@LazySingleton(as: SearchRemoteDatasource)
class SearchDatasourceImpl implements SearchRemoteDatasource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth auth;
  final FirebaseStorage storage;

  SearchDatasourceImpl(this.fireStore, this.auth, this.storage);

  ///////////// Get listUser /////////////
  @override
  Future<List<UserModel>> getlistUser({required String username}) async {
    try {
      QuerySnapshot snapshot = await fireStore.collection('users').get();
      List<UserModel> listUser = snapshot.docs.map((doc) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      if (username.isNotEmpty) {
        listUser = listUser
            .where((element) =>
                element.displayName!
                    .toLowerCase()
                    .contains(username.toLowerCase()) ||
                element.email!.toLowerCase().contains(username.toLowerCase()))
            .toList();
      }
      return listUser;
    } on FirebaseException catch (e) {
      throw ServerException(e.toString());
    }
  }
}
