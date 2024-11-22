// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num?)?.toInt(),
      nome: json['nome'] as String,
      usuario: json['usuario'] as String,
      senha: json['senha'] as String,
      cpf: json['cpf'] as String,
      email: json['email'] as String,
      dataCriacao: DateTime.parse(json['dataCriacao'] as String),
      tell: json['tell'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'usuario': instance.usuario,
      'senha': instance.senha,
      'cpf': instance.cpf,
      'email': instance.email,
      'dataCriacao': instance.dataCriacao.toIso8601String(),
      'tell': instance.tell,
    };
