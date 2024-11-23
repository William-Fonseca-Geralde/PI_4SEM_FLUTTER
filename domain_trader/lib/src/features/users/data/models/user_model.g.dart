// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      nome: json['nome'] as String,
      senha: json['senha'] as String,
      email: json['email'] as String,
      tell: json['tell'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'senha': instance.senha,
      'email': instance.email,
      'tell': instance.tell,
    };
