// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelResponse _$HotelResponseFromJson(Map<String, dynamic> json) =>
    HotelResponse(
      defaultMin: (json['defaultMin'] as num).toInt(),
      defaultMax: (json['defaultMax'] as num).toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Hotel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      searchMin: (json['searchMin'] as num).toInt(),
      searchMax: (json['searchMax'] as num).toInt(),
    );

Map<String, dynamic> _$HotelResponseToJson(HotelResponse instance) =>
    <String, dynamic>{
      'defaultMin': instance.defaultMin,
      'defaultMax': instance.defaultMax,
      'data': instance.data,
      'count': instance.count,
      'searchMin': instance.searchMin,
      'searchMax': instance.searchMax,
    };
