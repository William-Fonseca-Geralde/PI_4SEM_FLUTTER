import 'package:freezed_annotation/freezed_annotation.dart';

part 'domain_model.freezed.dart';
part 'domain_model.g.dart';

@freezed
class DomainModel with _$DomainModel {
  factory DomainModel({
    required String url,
    required int idUser,
    required double preco,
    required String dataExpiracao,
    required String status,
    required String categoria,
  }) = _UserModel;

  factory DomainModel.fromJson(Map<String, dynamic> json)
    => _$DomainModelFromJson(json);
}