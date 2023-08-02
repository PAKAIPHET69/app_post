import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? uid;
  final String? displayName;
  final String? email;
  final List? followers;
  final List? following;

  const User({
    this.followers,
    this.following,
    this.uid,
    this.displayName,
    this.email,
  });
  
  @override
  List<Object?> get props => [followers, following, uid, displayName, email];
}
