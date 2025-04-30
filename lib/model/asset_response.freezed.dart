// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AssetResponse _$AssetResponseFromJson(Map<String, dynamic> json) {
  return _AssetResponse.fromJson(json);
}

/// @nodoc
mixin _$AssetResponse {
  @JsonKey(name: "list_quotes")
  List<Quote> get list => throw _privateConstructorUsedError;

  /// Serializes this AssetResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssetResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetResponseCopyWith<AssetResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetResponseCopyWith<$Res> {
  factory $AssetResponseCopyWith(
    AssetResponse value,
    $Res Function(AssetResponse) then,
  ) = _$AssetResponseCopyWithImpl<$Res, AssetResponse>;
  @useResult
  $Res call({@JsonKey(name: "list_quotes") List<Quote> list});
}

/// @nodoc
class _$AssetResponseCopyWithImpl<$Res, $Val extends AssetResponse>
    implements $AssetResponseCopyWith<$Res> {
  _$AssetResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? list = null}) {
    return _then(
      _value.copyWith(
            list:
                null == list
                    ? _value.list
                    : list // ignore: cast_nullable_to_non_nullable
                        as List<Quote>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AssetResponseImplCopyWith<$Res>
    implements $AssetResponseCopyWith<$Res> {
  factory _$$AssetResponseImplCopyWith(
    _$AssetResponseImpl value,
    $Res Function(_$AssetResponseImpl) then,
  ) = __$$AssetResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "list_quotes") List<Quote> list});
}

/// @nodoc
class __$$AssetResponseImplCopyWithImpl<$Res>
    extends _$AssetResponseCopyWithImpl<$Res, _$AssetResponseImpl>
    implements _$$AssetResponseImplCopyWith<$Res> {
  __$$AssetResponseImplCopyWithImpl(
    _$AssetResponseImpl _value,
    $Res Function(_$AssetResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AssetResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? list = null}) {
    return _then(
      _$AssetResponseImpl(
        list:
            null == list
                ? _value._list
                : list // ignore: cast_nullable_to_non_nullable
                    as List<Quote>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetResponseImpl implements _AssetResponse {
  const _$AssetResponseImpl({
    @JsonKey(name: "list_quotes") required final List<Quote> list,
  }) : _list = list;

  factory _$AssetResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetResponseImplFromJson(json);

  final List<Quote> _list;
  @override
  @JsonKey(name: "list_quotes")
  List<Quote> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'AssetResponse(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetResponseImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  /// Create a copy of AssetResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetResponseImplCopyWith<_$AssetResponseImpl> get copyWith =>
      __$$AssetResponseImplCopyWithImpl<_$AssetResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetResponseImplToJson(this);
  }
}

abstract class _AssetResponse implements AssetResponse {
  const factory _AssetResponse({
    @JsonKey(name: "list_quotes") required final List<Quote> list,
  }) = _$AssetResponseImpl;

  factory _AssetResponse.fromJson(Map<String, dynamic> json) =
      _$AssetResponseImpl.fromJson;

  @override
  @JsonKey(name: "list_quotes")
  List<Quote> get list;

  /// Create a copy of AssetResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetResponseImplCopyWith<_$AssetResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
