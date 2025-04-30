import 'package:freezed_annotation/freezed_annotation.dart';

import 'quote.dart';

part 'asset_response.freezed.dart';
part 'asset_response.g.dart';

@freezed
class AssetResponse with _$AssetResponse {
  const factory AssetResponse({
    @JsonKey(name: "list_quotes") required List<Quote> list,
  }) = _AssetResponse;

  factory AssetResponse.fromJson(json) => _$AssetResponseFromJson(json);
}
