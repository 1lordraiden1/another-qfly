// To parse this JSON data, do
//
//     final hotel = hotelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

Hotel hotelFromJson(String str) => Hotel.fromJson(json.decode(str));

String hotelToJson(Hotel data) => json.encode(data.toJson());

@JsonSerializable()
class Hotel {
  String? companyName;
  int? hotelCode;
  String? hotelName;
  String? photo;
  String? description;
  String? address;
  String? longitude;
  String? latitude;
  String? rating;
  double? price;
  String? currency;
  AllData? allData;

  Hotel({
    this.companyName,
    this.hotelCode,
    this.hotelName,
    this.photo,
    this.description,
    this.address,
    this.longitude,
    this.latitude,
    this.rating,
    this.price,
    this.currency,
    this.allData,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        companyName: json["company_name"],
        hotelCode: json["hotel_code"],
        hotelName: json["hotel_name"],
        photo: json["photo"],
        description: json["description"],
        address: json["address"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        rating: json["rating"],
        price: json["price"]?.toDouble(),
        currency: json["currency"],
        allData: json["all_data"] == null
            ? null
            : AllData.fromJson(json["all_data"]),
      );

  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "hotel_code": hotelCode,
        "hotel_name": hotelName,
        "photo": photo,
        "description": description,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "rating": rating,
        "price": price,
        "currency": currency,
        "all_data": allData?.toJson(),
      };
}

class AllData {
  String? hotelBookingCode;
  HotelInfo? hotelInfo;
  MinHotelPrice? minHotelPrice;
  bool? isPkgProperty;
  bool? isPackageRate;
  bool? mappedHotel;
  bool? isHalal;

  AllData({
    this.hotelBookingCode,
    this.hotelInfo,
    this.minHotelPrice,
    this.isPkgProperty,
    this.isPackageRate,
    this.mappedHotel,
    this.isHalal,
  });

  factory AllData.fromJson(Map<String, dynamic> json) => AllData(
        hotelBookingCode: json["HotelBookingCode"],
        hotelInfo: json["HotelInfo"] == null
            ? null
            : HotelInfo.fromJson(json["HotelInfo"]),
        minHotelPrice: json["MinHotelPrice"] == null
            ? null
            : MinHotelPrice.fromJson(json["MinHotelPrice"]),
        isPkgProperty: json["IsPkgProperty"],
        isPackageRate: json["IsPackageRate"],
        mappedHotel: json["MappedHotel"],
        isHalal: json["IsHalal"],
      );

  Map<String, dynamic> toJson() => {
        "HotelBookingCode": hotelBookingCode,
        "HotelInfo": hotelInfo?.toJson(),
        "MinHotelPrice": minHotelPrice?.toJson(),
        "IsPkgProperty": isPkgProperty,
        "IsPackageRate": isPackageRate,
        "MappedHotel": mappedHotel,
        "IsHalal": isHalal,
      };
}

class HotelInfo {
  int? hotelCode;
  String? hotelName;
  String? hotelPicture;
  String? hotelDescription;
  String? latitude;
  String? longitude;
  String? hotelAddress;
  String? rating;
  String? tripAdvisorRating;
  String? tagIds;

  HotelInfo({
    this.hotelCode,
    this.hotelName,
    this.hotelPicture,
    this.hotelDescription,
    this.latitude,
    this.longitude,
    this.hotelAddress,
    this.rating,
    this.tripAdvisorRating,
    this.tagIds,
  });

  factory HotelInfo.fromJson(Map<String, dynamic> json) => HotelInfo(
        hotelCode: json["HotelCode"],
        hotelName: json["HotelName"],
        hotelPicture: json["HotelPicture"],
        hotelDescription: json["HotelDescription"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        hotelAddress: json["HotelAddress"],
        rating: json["Rating"],
        tripAdvisorRating: json["TripAdvisorRating"],
        tagIds: json["TagIds"],
      );

  Map<String, dynamic> toJson() => {
        "HotelCode": hotelCode,
        "HotelName": hotelName,
        "HotelPicture": hotelPicture,
        "HotelDescription": hotelDescription,
        "Latitude": latitude,
        "Longitude": longitude,
        "HotelAddress": hotelAddress,
        "Rating": rating,
        "TripAdvisorRating": tripAdvisorRating,
        "TagIds": tagIds,
      };
}

class MinHotelPrice {
  double? totalPrice;
  String? currency;
  double? originalPrice;

  MinHotelPrice({
    this.totalPrice,
    this.currency,
    this.originalPrice,
  });

  factory MinHotelPrice.fromJson(Map<String, dynamic> json) => MinHotelPrice(
        totalPrice: json["TotalPrice"]?.toDouble(),
        currency: json["Currency"],
        originalPrice: json["OriginalPrice"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "TotalPrice": totalPrice,
        "Currency": currency,
        "OriginalPrice": originalPrice,
      };
}
