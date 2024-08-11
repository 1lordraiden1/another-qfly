import 'dart:convert';

class FlightDetailsModel {
  List<List<FareQuote>>? fareRule;
  List<List<FareQuote>>? fareQuote;
  List<List<FareQuote>>? ssR;

  FlightDetailsModel({
    this.fareRule,
    this.fareQuote,
    this.ssR,
  });

  factory FlightDetailsModel.empty() {
    return FlightDetailsModel(fareRule: [], fareQuote: [], ssR: []);
  }

  factory FlightDetailsModel.fromRawJson(String str) =>
      FlightDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FlightDetailsModel.fromJson(Map<String, dynamic> json) =>
      FlightDetailsModel(
        fareRule: json["fareRule"] == null
            ? []
            : List<List<FareQuote>>.from(json["fareRule"]!.map((x) =>
                List<FareQuote>.from(x.map((x) => FareQuote.fromJson(x))))),
        fareQuote: json["fareQuote"] == null
            ? []
            : List<List<FareQuote>>.from(json["fareQuote"]!.map((x) =>
                List<FareQuote>.from(x.map((x) => FareQuote.fromJson(x))))),
        ssR: json["ssR"] == null
            ? []
            : List<List<FareQuote>>.from(json["ssR"]!.map((x) =>
                List<FareQuote>.from(x.map((x) => FareQuote.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "fareRule": fareRule == null
            ? []
            : List<dynamic>.from(fareRule!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "fareQuote": fareQuote == null
            ? []
            : List<dynamic>.from(fareQuote!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "ssR": ssR == null
            ? []
            : List<dynamic>.from(
                ssR!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class FareQuote {
  String? origin;
  String? destination;
  String? airline;
  String? fareRestriction;
  String? fareBasisCode;
  String? fareFamilyCode;
  String? fareRuleDetail;
  dynamic fareRuleIndex;
  DateTime? departureDate;
  String? flightNumber;
  dynamic freeTextFareRuleDetail;

  FareQuote({
    this.origin,
    this.destination,
    this.airline,
    this.fareRestriction,
    this.fareBasisCode,
    this.fareFamilyCode,
    this.fareRuleDetail,
    this.fareRuleIndex,
    this.departureDate,
    this.flightNumber,
    this.freeTextFareRuleDetail,
  });

  factory FareQuote.empty() {
    return FareQuote(
      airline: '',
      departureDate: DateTime.now(),
      destination: '',
      fareBasisCode: '',
      fareFamilyCode: '',
      fareRestriction: '',
      fareRuleDetail: '',
      fareRuleIndex: '',
      flightNumber: '',
      freeTextFareRuleDetail: '',
      origin: '',
    );
  }

  factory FareQuote.fromRawJson(String str) =>
      FareQuote.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FareQuote.fromJson(Map<String, dynamic> json) => FareQuote(
        origin: json["Origin"],
        destination: json["Destination"],
        airline: json["Airline"],
        fareRestriction: json["FareRestriction"],
        fareBasisCode: json["FareBasisCode"],
        fareFamilyCode: json["FareFamilyCode"],
        fareRuleDetail: json["FareRuleDetail"],
        fareRuleIndex: json["FareRuleIndex"],
        departureDate: json["DepartureDate"] == null
            ? null
            : DateTime.parse(json["DepartureDate"]),
        flightNumber: json["FlightNumber"],
        freeTextFareRuleDetail: json["FreeTextFareRuleDetail"],
      );

  Map<String, dynamic> toJson() => {
        "Origin": origin,
        "Destination": destination,
        "Airline": airline,
        "FareRestriction": fareRestriction,
        "FareBasisCode": fareBasisCode,
        "FareFamilyCode": fareFamilyCode,
        "FareRuleDetail": fareRuleDetail,
        "FareRuleIndex": fareRuleIndex,
        "DepartureDate": departureDate?.toIso8601String(),
        "FlightNumber": flightNumber,
        "FreeTextFareRuleDetail": freeTextFareRuleDetail,
      };
}
