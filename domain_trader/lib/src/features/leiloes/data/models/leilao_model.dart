import 'package:freezed_annotation/freezed_annotation.dart';

part 'leilao_model.freezed.dart';
part 'leilao_model.g.dart';

@freezed
class LeilaoModel with _$LeilaoModel {
  factory LeilaoModel({
    required int id_dominio,
    required int id_usuario,
    required double valor,
  }) = _LeilaoModel;

  factory LeilaoModel.fromJson(Map<String, dynamic> json) => _$LeilaoModelFromJson(json);
}