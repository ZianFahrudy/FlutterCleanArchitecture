import 'package:flutter_clean_architecture/core/components/domains/entities/response/meta_model_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class MetaModel extends MetaModelEntity {
  final int? code;
  final String? status;
  final String? message;

  MetaModel({this.code, this.status, this.message})
      : super(code: code, message: message, status: status);

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);
}
