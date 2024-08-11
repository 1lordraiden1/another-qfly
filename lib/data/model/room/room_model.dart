import 'dart:convert';

RoomOfHotel hotelFromJson(String str) => RoomOfHotel.fromJson(json.decode(str));

String hotelToJson(RoomOfHotel data) => json.encode(data.toJson());

class RoomOfHotel {
  String? companyName;
  String? hotelCode;
  String? currency;
  List<String>? nameRoom;
  String? bookingCode;
  String? inclusion;
  List<List<DayRate>>? dayRates;
  double? totalFare;
  double? totalTax;
  List<CancelPolicy>? cancelPolicies;
  String? mealType;
  bool? isRefundable;
  bool? withTransfers;
  AllData? allData;

  RoomOfHotel({
    this.companyName,
    this.hotelCode,
    this.currency,
    this.nameRoom,
    this.bookingCode,
    this.inclusion,
    this.dayRates,
    this.totalFare,
    this.totalTax,
    this.cancelPolicies,
    this.mealType,
    this.isRefundable,
    this.withTransfers,
    this.allData,
  });

  factory RoomOfHotel.fromJson(Map<String, dynamic> json) => RoomOfHotel(
        companyName: json["company_name"],
        hotelCode: json["hotel_code"],
        currency: json["currency"],
        nameRoom: json["name_room"] == null
            ? []
            : List<String>.from(json["name_room"]!.map((x) => x)),
        bookingCode: json["bookingCode"],
        inclusion: json["inclusion"],
        dayRates: json["dayRates"] == null
            ? []
            : List<List<DayRate>>.from(json["dayRates"]!.map(
                (x) => List<DayRate>.from(x.map((x) => DayRate.fromJson(x))))),
        totalFare: json["totalFare"]?.toDouble(),
        totalTax: json["totalTax"]?.toDouble(),
        cancelPolicies: json["cancelPolicies"] == null
            ? []
            : List<CancelPolicy>.from(
                json["cancelPolicies"]!.map((x) => CancelPolicy.fromJson(x))),
        mealType: json["mealType"],
        isRefundable: json["isRefundable"],
        withTransfers: json["withTransfers"],
        allData: json["all_data"] == null
            ? null
            : AllData.fromJson(json["all_data"]),
      );

  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "hotel_code": hotelCode,
        "currency": currency,
        "name_room":
            nameRoom == null ? [] : List<dynamic>.from(nameRoom!.map((x) => x)),
        "bookingCode": bookingCode,
        "inclusion": inclusion,
        "dayRates": dayRates == null
            ? []
            : List<dynamic>.from(dayRates!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "totalFare": totalFare,
        "totalTax": totalTax,
        "cancelPolicies": cancelPolicies == null
            ? []
            : List<dynamic>.from(cancelPolicies!.map((x) => x.toJson())),
        "mealType": mealType,
        "isRefundable": isRefundable,
        "withTransfers": withTransfers,
        "all_data": allData?.toJson(),
      };
}

class AllData {
  List<String>? name;
  String? bookingCode;
  String? inclusion;
  List<List<DayRate>>? dayRates;
  double? totalFare;
  double? totalTax;
  List<dynamic>? roomPromotion;
  List<CancelPolicy>? cancelPolicies;
  String? mealType;
  bool? isRefundable;
  bool? withTransfers;

  AllData({
    this.name,
    this.bookingCode,
    this.inclusion,
    this.dayRates,
    this.totalFare,
    this.totalTax,
    this.roomPromotion,
    this.cancelPolicies,
    this.mealType,
    this.isRefundable,
    this.withTransfers,
  });

  factory AllData.fromJson(Map<String, dynamic> json) => AllData(
        name: json["Name"] == null
            ? []
            : List<String>.from(json["Name"]!.map((x) => x)),
        bookingCode: json["BookingCode"],
        inclusion: json["Inclusion"],
        dayRates: json["DayRates"] == null
            ? []
            : List<List<DayRate>>.from(json["DayRates"]!.map(
                (x) => List<DayRate>.from(x.map((x) => DayRate.fromJson(x))))),
        totalFare: json["TotalFare"]?.toDouble(),
        totalTax: json["TotalTax"]?.toDouble(),
        roomPromotion: json["RoomPromotion"] == null
            ? []
            : List<dynamic>.from(json["RoomPromotion"]!.map((x) => x)),
        cancelPolicies: json["CancelPolicies"] == null
            ? []
            : List<CancelPolicy>.from(
                json["CancelPolicies"]!.map((x) => CancelPolicy.fromJson(x))),
        mealType: json["MealType"],
        isRefundable: json["IsRefundable"],
        withTransfers: json["WithTransfers"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name == null ? [] : List<dynamic>.from(name!.map((x) => x)),
        "BookingCode": bookingCode,
        "Inclusion": inclusion,
        "DayRates": dayRates == null
            ? []
            : List<dynamic>.from(dayRates!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "TotalFare": totalFare,
        "TotalTax": totalTax,
        "RoomPromotion": roomPromotion == null
            ? []
            : List<dynamic>.from(roomPromotion!.map((x) => x)),
        "CancelPolicies": cancelPolicies == null
            ? []
            : List<dynamic>.from(cancelPolicies!.map((x) => x.toJson())),
        "MealType": mealType,
        "IsRefundable": isRefundable,
        "WithTransfers": withTransfers,
      };
}

class CancelPolicy {
  String? fromDate;
  String? chargeType;
  int? cancellationCharge;

  CancelPolicy({
    this.fromDate,
    this.chargeType,
    this.cancellationCharge,
  });

  factory CancelPolicy.fromJson(Map<String, dynamic> json) => CancelPolicy(
        fromDate: json["FromDate"],
        chargeType: json["ChargeType"],
        cancellationCharge: json["CancellationCharge"],
      );

  Map<String, dynamic> toJson() => {
        "FromDate": fromDate,
        "ChargeType": chargeType,
        "CancellationCharge": cancellationCharge,
      };
}

class DayRate {
  double? basePrice;

  DayRate({
    this.basePrice,
  });

  factory DayRate.fromJson(Map<String, dynamic> json) => DayRate(
        basePrice: json["BasePrice"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "BasePrice": basePrice,
      };
}
