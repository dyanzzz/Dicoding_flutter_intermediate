// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuoteImpl _$$QuoteImplFromJson(Map<String, dynamic> json) => _$QuoteImpl(
  id: json['id'] as String,
  en: json['en'] as String,
  author: json['author'] as String,
  rating: (json['rating'] as num).toDouble(),
);

Map<String, dynamic> _$$QuoteImplToJson(_$QuoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'en': instance.en,
      'author': instance.author,
      'rating': instance.rating,
    };
