import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final dynamic message;

  const Failure({this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  final dynamic message;

  const ServerFailure({this.message});

  @override
  List<Object?> get props => [message];
}

class SocketFailure extends Failure {
  final String? message;

  const SocketFailure({required this.message});
}

class CacheFailure extends Failure {
  final String? message;

  const CacheFailure({this.message});

  @override
  List<Object?> get props => [message];
}

class AnotherFailure extends Failure {
  final String? message;

  const AnotherFailure({required this.message});

  @override
  List<Object> get props => [message!];
}
