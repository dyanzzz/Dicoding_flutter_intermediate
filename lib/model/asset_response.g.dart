// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetResponseImpl _$$AssetResponseImplFromJson(Map<String, dynamic> json) =>
    _$AssetResponseImpl(
      list:
          (json['list_quotes'] as List<dynamic>)
              .map((e) => Quote.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$AssetResponseImplToJson(_$AssetResponseImpl instance) =>
    <String, dynamic>{'list_quotes': instance.list};
