import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String msg;
  const Failure(this.msg);
  @override
  List<Object> get props => [msg];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(String msg) : super(msg);
}
