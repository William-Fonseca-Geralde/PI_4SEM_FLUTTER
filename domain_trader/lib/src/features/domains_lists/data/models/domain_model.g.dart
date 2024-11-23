// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num?)?.toInt(),
      idUser: (json['idUser'] as num).toInt(),
      preco: (json['preco'] as num).toDouble(),
      dataCriacao: DateTime.parse(json['dataCriacao'] as String),
      dataExpiracao: DateTime.parse(json['dataExpiracao'] as String),
      status: (json['status'] as List<dynamic>).toSet(),
      categoria: json['categoria'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idUser': instance.idUser,
      'preco': instance.preco,
      'dataCriacao': instance.dataCriacao.toIso8601String(),
      'dataExpiracao': instance.dataExpiracao.toIso8601String(),
      'status': instance.status.toList(),
      'categoria': instance.categoria,
    };
