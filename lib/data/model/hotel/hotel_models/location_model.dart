import 'package:qfly/data/model/hotel/hotel_models/geocodes_model.dart';

class Location {
  final String cityName;
  final String? code;
  final String? name;
  final GeoCodes geoCodes;

  Location({
    required this.cityName,
    this.code,
    this.name,
    required this.geoCodes,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      cityName: json['cityName'] as String,
      code: json['code'] as String?,
      name: json['name'] as String?,
      geoCodes: GeoCodes.fromJson(json['geoCodes'] as Map<String, dynamic>),
    );
  }
}
