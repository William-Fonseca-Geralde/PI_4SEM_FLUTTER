// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leilao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeilaoModelImpl _$$LeilaoModelImplFromJson(Map<String, dynamic> json) =>
    _$LeilaoModelImpl(
      id_dominio: (json['id_dominio'] as num).toInt(),
      id_usuario: (json['id_usuario'] as num).toInt(),
      valor: (json['valor'] as num).toDouble(),
    );

Map<String, dynamic> _$$LeilaoModelImplToJson(_$LeilaoModelImpl instance) =>
    <String, dynamic>{
      'id_dominio': instance.id_dominio,
      'id_usuario': instance.id_usuario,
      'valor': instance.valor,
    };
