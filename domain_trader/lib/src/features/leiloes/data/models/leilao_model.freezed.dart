// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leilao_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeilaoModel _$LeilaoModelFromJson(Map<String, dynamic> json) {
  return _LeilaoModel.fromJson(json);
}

/// @nodoc
mixin _$LeilaoModel {
  int get id_dominio => throw _privateConstructorUsedError;
  int get id_usuario => throw _privateConstructorUsedError;
  double get valor => throw _privateConstructorUsedError;

  /// Serializes this LeilaoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeilaoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeilaoModelCopyWith<LeilaoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeilaoModelCopyWith<$Res> {
  factory $LeilaoModelCopyWith(
          LeilaoModel value, $Res Function(LeilaoModel) then) =
      _$LeilaoModelCopyWithImpl<$Res, LeilaoModel>;
  @useResult
  $Res call({int id_dominio, int id_usuario, double valor});
}

/// @nodoc
class _$LeilaoModelCopyWithImpl<$Res, $Val extends LeilaoModel>
    implements $LeilaoModelCopyWith<$Res> {
  _$LeilaoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeilaoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_dominio = null,
    Object? id_usuario = null,
    Object? valor = null,
  }) {
    return _then(_value.copyWith(
      id_dominio: null == id_dominio
          ? _value.id_dominio
          : id_dominio // ignore: cast_nullable_to_non_nullable
              as int,
      id_usuario: null == id_usuario
          ? _value.id_usuario
          : id_usuario // ignore: cast_nullable_to_non_nullable
              as int,
      valor: null == valor
          ? _value.valor
          : valor // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeilaoModelImplCopyWith<$Res>
    implements $LeilaoModelCopyWith<$Res> {
  factory _$$LeilaoModelImplCopyWith(
          _$LeilaoModelImpl value, $Res Function(_$LeilaoModelImpl) then) =
      __$$LeilaoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id_dominio, int id_usuario, double valor});
}

/// @nodoc
class __$$LeilaoModelImplCopyWithImpl<$Res>
    extends _$LeilaoModelCopyWithImpl<$Res, _$LeilaoModelImpl>
    implements _$$LeilaoModelImplCopyWith<$Res> {
  __$$LeilaoModelImplCopyWithImpl(
      _$LeilaoModelImpl _value, $Res Function(_$LeilaoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeilaoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_dominio = null,
    Object? id_usuario = null,
    Object? valor = null,
  }) {
    return _then(_$LeilaoModelImpl(
      id_dominio: null == id_dominio
          ? _value.id_dominio
          : id_dominio // ignore: cast_nullable_to_non_nullable
              as int,
      id_usuario: null == id_usuario
          ? _value.id_usuario
          : id_usuario // ignore: cast_nullable_to_non_nullable
              as int,
      valor: null == valor
          ? _value.valor
          : valor // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeilaoModelImpl implements _LeilaoModel {
  _$LeilaoModelImpl(
      {required this.id_dominio,
      required this.id_usuario,
      required this.valor});

  factory _$LeilaoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeilaoModelImplFromJson(json);

  @override
  final int id_dominio;
  @override
  final int id_usuario;
  @override
  final double valor;

  @override
  String toString() {
    return 'LeilaoModel(id_dominio: $id_dominio, id_usuario: $id_usuario, valor: $valor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeilaoModelImpl &&
            (identical(other.id_dominio, id_dominio) ||
                other.id_dominio == id_dominio) &&
            (identical(other.id_usuario, id_usuario) ||
                other.id_usuario == id_usuario) &&
            (identical(other.valor, valor) || other.valor == valor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id_dominio, id_usuario, valor);

  /// Create a copy of LeilaoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeilaoModelImplCopyWith<_$LeilaoModelImpl> get copyWith =>
      __$$LeilaoModelImplCopyWithImpl<_$LeilaoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeilaoModelImplToJson(
      this,
    );
  }
}

abstract class _LeilaoModel implements LeilaoModel {
  factory _LeilaoModel(
      {required final int id_dominio,
      required final int id_usuario,
      required final double valor}) = _$LeilaoModelImpl;

  factory _LeilaoModel.fromJson(Map<String, dynamic> json) =
      _$LeilaoModelImpl.fromJson;

  @override
  int get id_dominio;
  @override
  int get id_usuario;
  @override
  double get valor;

  /// Create a copy of LeilaoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeilaoModelImplCopyWith<_$LeilaoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
