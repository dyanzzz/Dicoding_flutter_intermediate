import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';

@JsonSerializable()
class Quote {
  final String id;
  final String en;
  final String author;
  final double rating;

  Quote({
    required this.id,
    required this.en,
    required this.author,
    required this.rating,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
