import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    int? id,
    required String nome,
    required String usuario,
    required String senha,
    required String cpf,
    required String email,
    required DateTime dataCriacao,
    required String tell,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) 
    => _$UserModelFromJson(json);
}