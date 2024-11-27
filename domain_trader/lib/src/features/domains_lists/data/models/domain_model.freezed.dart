// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domain_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DomainModel _$DomainModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$DomainModel {
  String get url => throw _privateConstructorUsedError;
  int get idUser => throw _privateConstructorUsedError;
  double get preco => throw _privateConstructorUsedError;
  String get dataExpiracao => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get categoria => throw _privateConstructorUsedError;

  /// Serializes this DomainModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DomainModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DomainModelCopyWith<DomainModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainModelCopyWith<$Res> {
  factory $DomainModelCopyWith(
          DomainModel value, $Res Function(DomainModel) then) =
      _$DomainModelCopyWithImpl<$Res, DomainModel>;
  @useResult
  $Res call(
      {String url,
      int idUser,
      double preco,
      String dataExpiracao,
      String status,
      String categoria});
}

/// @nodoc
class _$DomainModelCopyWithImpl<$Res, $Val extends DomainModel>
    implements $DomainModelCopyWith<$Res> {
  _$DomainModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DomainModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? idUser = null,
    Object? preco = null,
    Object? dataExpiracao = null,
    Object? status = null,
    Object? categoria = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int,
      preco: null == preco
          ? _value.preco
          : preco // ignore: cast_nullable_to_non_nullable
              as double,
      dataExpiracao: null == dataExpiracao
          ? _value.dataExpiracao
          : dataExpiracao // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      categoria: null == categoria
          ? _value.categoria
          : categoria // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $DomainModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      int idUser,
      double preco,
      String dataExpiracao,
      String status,
      String categoria});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$DomainModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DomainModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? idUser = null,
    Object? preco = null,
    Object? dataExpiracao = null,
    Object? status = null,
    Object? categoria = null,
  }) {
    return _then(_$UserModelImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int,
      preco: null == preco
          ? _value.preco
          : preco // ignore: cast_nullable_to_non_nullable
              as double,
      dataExpiracao: null == dataExpiracao
          ? _value.dataExpiracao
          : dataExpiracao // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      categoria: null == categoria
          ? _value.categoria
          : categoria // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {required this.url,
      required this.idUser,
      required this.preco,
      required this.dataExpiracao,
      required this.status,
      required this.categoria});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String url;
  @override
  final int idUser;
  @override
  final double preco;
  @override
  final String dataExpiracao;
  @override
  final String status;
  @override
  final String categoria;

  @override
  String toString() {
    return 'DomainModel(url: $url, idUser: $idUser, preco: $preco, dataExpiracao: $dataExpiracao, status: $status, categoria: $categoria)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.preco, preco) || other.preco == preco) &&
            (identical(other.dataExpiracao, dataExpiracao) ||
                other.dataExpiracao == dataExpiracao) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.categoria, categoria) ||
                other.categoria == categoria));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, url, idUser, preco, dataExpiracao, status, categoria);

  /// Create a copy of DomainModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements DomainModel {
  factory _UserModel(
      {required final String url,
      required final int idUser,
      required final double preco,
      required final String dataExpiracao,
      required final String status,
      required final String categoria}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get url;
  @override
  int get idUser;
  @override
  double get preco;
  @override
  String get dataExpiracao;
  @override
  String get status;
  @override
  String get categoria;

  /// Create a copy of DomainModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
