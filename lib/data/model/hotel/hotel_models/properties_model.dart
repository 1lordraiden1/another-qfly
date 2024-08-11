import 'package:qfly/data/model/hotel/hotel_models/category_model.dart';
import 'package:qfly/data/model/hotel/hotel_models/location_model.dart';

class Properties {
  final String hotelId;
  final String name;
  final String address;
  final String phone;
  final Category category;
  final Location location;
  final List<String> images;
  final List<String> information;

  Properties({
    required this.hotelId,
    required this.name,
    required this.address,
    required this.phone,
    required this.category,
    required this.location,
    required this.images,
    required this.information,
  });

  factory Properties.fromJson(Map<String, dynamic> json) {
    return Properties(
      hotelId: json['hotelId'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>).cast<String>(),
      information: (json['information'] as List<dynamic>).cast<String>(),
    );
  }
}
