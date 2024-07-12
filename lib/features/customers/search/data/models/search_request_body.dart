import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_request_body.g.dart';
@JsonSerializable()
class SearchRequestBody {

  SearchRequestBody({
    required this.searchName,
    required this.price_min,
    required this.price_max,
  });
  final String searchName;
  final int price_min;
  final int price_max;
  Map<String, dynamic> toJson() => _$SearchRequestBodyToJson(this);
}
