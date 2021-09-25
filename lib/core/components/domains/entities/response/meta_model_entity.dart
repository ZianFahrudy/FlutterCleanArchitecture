import 'package:equatable/equatable.dart';

class MetaModelEntity extends Equatable {
  final int? code;
  final String? status;
  final String? message;

  MetaModelEntity({this.code, this.status, this.message});
  @override
  List<Object?> get props => [code, status, message];
}
