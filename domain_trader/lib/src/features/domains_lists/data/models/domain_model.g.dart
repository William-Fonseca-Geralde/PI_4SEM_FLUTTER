// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      url: json['url'] as String,
      idUser: (json['idUser'] as num).toInt(),
      preco: (json['preco'] as num).toDouble(),
      dataExpiracao: json['dataExpiracao'] as String,
      status: json['status'] as String,
      categoria: json['categoria'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'idUser': instance.idUser,
      'preco': instance.preco,
      'dataExpiracao': instance.dataExpiracao,
      'status': instance.status,
      'categoria': instance.categoria,
    };
