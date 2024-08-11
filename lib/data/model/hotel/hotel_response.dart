import 'package:json_annotation/json_annotation.dart';
import 'package:qfly/data/model/hotel/hotel_model.dart';

part 'hotel_response.g.dart';

@JsonSerializable()
class HotelResponse {
  final int defaultMin;
  final int defaultMax;
  final List<Hotel>? data;

  final int count;
  final int searchMin;

  final int searchMax;

  /* HotelResponse(
    this.errors, {
    required this.status,
    required this.message,
    required this.data,
  }); */

  HotelResponse({
    required this.defaultMin,
    required this.defaultMax,
    required this.data,
    required this.count,
    required this.searchMin,
    required this.searchMax,
  });

  factory HotelResponse.fromJson(Map<String, dynamic> json) =>
      _$HotelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HotelResponseToJson(this);
}
