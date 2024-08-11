import 'package:json_annotation/json_annotation.dart';
import 'package:qfly/data/model/hotel/hotel_model.dart';
import 'package:qfly/data/model/hotel/hotel_response.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  final int status;
  final String message;
  final HotelResponse? data;
  final Map<String, dynamic>? errors;

  ApiResponse({
    required this.status,
    required this.message,
    this.data,
    this.errors,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
