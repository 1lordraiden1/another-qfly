import 'dart:convert';

class Flight {
    String? companyName;
    String? resultId;
    bool? isLcc;
    bool? nonRefundable;
    String? airlineRemark;
    Fare? fare;
    List<FareBreakdown>? fareBreakdown;
    AllData? allData;

    Flight({
        this.companyName,
        this.resultId,
        this.isLcc,
        this.nonRefundable,
        this.airlineRemark,
        this.fare,
        this.fareBreakdown,
        this.allData,
    });

    factory Flight.fromRawJson(String str) => Flight.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Flight.fromJson(Map<String, dynamic> json) => Flight(
        companyName: json["company_name"],
        resultId: json["resultId"],
        isLcc: json["isLcc"],
        nonRefundable: json["nonRefundable"],
        airlineRemark: json["airlineRemark"],
        fare: json["fare"] == null ? null : Fare.fromJson(json["fare"]),
        fareBreakdown: json["fareBreakdown"] == null ? [] : List<FareBreakdown>.from(json["fareBreakdown"]!.map((x) => FareBreakdown.fromJson(x))),
        allData: json["all_data"] == null ? null : AllData.fromJson(json["all_data"]),
    );

    Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "resultId": resultId,
        "isLcc": isLcc,
        "nonRefundable": nonRefundable,
        "airlineRemark": airlineRemark,
        "fare": fare?.toJson(),
        "fareBreakdown": fareBreakdown == null ? [] : List<dynamic>.from(fareBreakdown!.map((x) => x.toJson())),
        "all_data": allData?.toJson(),
    };
}

class AllData {
    String? resultId;
    String? origin;
    String? destination;
    bool? isLcc;
    bool? nonRefundable;
    String? airlineRemark;
    Fare? fare;
    List<FareBreakdown>? fareBreakdown;
    String? lastTicketDate;
    String? ticketAdvisory;
    List<List<Segment>>? segments;
    List<FareRule>? fareRules;
    String? providerRemarks;
    String? validatingAirline;
    int? tripIndicator;
    DateTime? responseTime;
    int? journeyType;
    bool? isVoidAllowed;
    bool? isRefundAllowed;
    bool? isReissueAllowed;
    dynamic corporateCodeDetail;
    bool? isShowUpsellOption;
    dynamic upsellOptionsList;
    bool? isCheckInBaggageFare;
    dynamic requiredFieldValidators;
    dynamic miniFareRules;
    bool? isVatApplicable;

    AllData({
        this.resultId,
        this.origin,
        this.destination,
        this.isLcc,
        this.nonRefundable,
        this.airlineRemark,
        this.fare,
        this.fareBreakdown,
        this.lastTicketDate,
        this.ticketAdvisory,
        this.segments,
        this.fareRules,
        this.providerRemarks,
        this.validatingAirline,
        this.tripIndicator,
        this.responseTime,
        this.journeyType,
        this.isVoidAllowed,
        this.isRefundAllowed,
        this.isReissueAllowed,
        this.corporateCodeDetail,
        this.isShowUpsellOption,
        this.upsellOptionsList,
        this.isCheckInBaggageFare,
        this.requiredFieldValidators,
        this.miniFareRules,
        this.isVatApplicable,
    });

    factory AllData.fromRawJson(String str) => AllData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AllData.fromJson(Map<String, dynamic> json) => AllData(
        resultId: json["ResultId"],
        origin: json["Origin"],
        destination: json["Destination"],
        isLcc: json["IsLcc"],
        nonRefundable: json["NonRefundable"],
        airlineRemark: json["AirlineRemark"],
        fare: json["Fare"] == null ? null : Fare.fromJson(json["Fare"]),
        fareBreakdown: json["FareBreakdown"] == null ? [] : List<FareBreakdown>.from(json["FareBreakdown"]!.map((x) => FareBreakdown.fromJson(x))),
        lastTicketDate: json["LastTicketDate"],
        ticketAdvisory: json["TicketAdvisory"],
        segments: json["Segments"] == null ? [] : List<List<Segment>>.from(json["Segments"]!.map((x) => List<Segment>.from(x.map((x) => Segment.fromJson(x))))),
        fareRules: json["FareRules"] == null ? [] : List<FareRule>.from(json["FareRules"]!.map((x) => FareRule.fromJson(x))),
        providerRemarks: json["ProviderRemarks"],
        validatingAirline: json["ValidatingAirline"],
        tripIndicator: json["TripIndicator"],
        responseTime: json["ResponseTime"] == null ? null : DateTime.parse(json["ResponseTime"]),
        journeyType: json["JourneyType"],
        isVoidAllowed: json["IsVoidAllowed"],
        isRefundAllowed: json["IsRefundAllowed"],
        isReissueAllowed: json["IsReissueAllowed"],
        corporateCodeDetail: json["CorporateCodeDetail"],
        isShowUpsellOption: json["IsShowUpsellOption"],
        upsellOptionsList: json["UpsellOptionsList"],
        isCheckInBaggageFare: json["IsCheckInBaggageFare"],
        requiredFieldValidators: json["RequiredFieldValidators"],
        miniFareRules: json["MiniFareRules"],
        isVatApplicable: json["IsVATApplicable"],
    );

    Map<String, dynamic> toJson() => {
        "ResultId": resultId,
        "Origin": origin,
        "Destination": destination,
        "IsLcc": isLcc,
        "NonRefundable": nonRefundable,
        "AirlineRemark": airlineRemark,
        "Fare": fare?.toJson(),
        "FareBreakdown": fareBreakdown == null ? [] : List<dynamic>.from(fareBreakdown!.map((x) => x.toJson())),
        "LastTicketDate": lastTicketDate,
        "TicketAdvisory": ticketAdvisory,
        "Segments": segments == null ? [] : List<dynamic>.from(segments!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "FareRules": fareRules == null ? [] : List<dynamic>.from(fareRules!.map((x) => x.toJson())),
        "ProviderRemarks": providerRemarks,
        "ValidatingAirline": validatingAirline,
        "TripIndicator": tripIndicator,
        "ResponseTime": responseTime?.toIso8601String(),
        "JourneyType": journeyType,
        "IsVoidAllowed": isVoidAllowed,
        "IsRefundAllowed": isRefundAllowed,
        "IsReissueAllowed": isReissueAllowed,
        "CorporateCodeDetail": corporateCodeDetail,
        "IsShowUpsellOption": isShowUpsellOption,
        "UpsellOptionsList": upsellOptionsList,
        "IsCheckInBaggageFare": isCheckInBaggageFare,
        "RequiredFieldValidators": requiredFieldValidators,
        "MiniFareRules": miniFareRules,
        "IsVATApplicable": isVatApplicable,
    };
}

class Fare {
    double? totalFare;
    String? fareType;
    int? agentMarkup;
    int? otherCharges;
    int? creditCardCharge;
    String? agentPreferredCurrency;
    int? serviceFee;
    double? baseFare;
    double? tax;
    int? penaltyAmount;
    int? vatAmount;
    int? vatPercentage;

    Fare({
        this.totalFare,
        this.fareType,
        this.agentMarkup,
        this.otherCharges,
        this.creditCardCharge,
        this.agentPreferredCurrency,
        this.serviceFee,
        this.baseFare,
        this.tax,
        this.penaltyAmount,
        this.vatAmount,
        this.vatPercentage,
    });

    factory Fare.fromRawJson(String str) => Fare.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Fare.fromJson(Map<String, dynamic> json) => Fare(
        totalFare: json["TotalFare"]?.toDouble(),
        fareType: json["FareType"],
        agentMarkup: json["AgentMarkup"],
        otherCharges: json["OtherCharges"],
        creditCardCharge: json["CreditCardCharge"],
        agentPreferredCurrency: json["AgentPreferredCurrency"],
        serviceFee: json["ServiceFee"],
        baseFare: json["BaseFare"]?.toDouble(),
        tax: json["Tax"]?.toDouble(),
        penaltyAmount: json["PenaltyAmount"],
        vatAmount: json["VATAmount"],
        vatPercentage: json["VATPercentage"],
    );

    Map<String, dynamic> toJson() => {
        "TotalFare": totalFare,
        "FareType": fareType,
        "AgentMarkup": agentMarkup,
        "OtherCharges": otherCharges,
        "CreditCardCharge": creditCardCharge,
        "AgentPreferredCurrency": agentPreferredCurrency,
        "ServiceFee": serviceFee,
        "BaseFare": baseFare,
        "Tax": tax,
        "PenaltyAmount": penaltyAmount,
        "VATAmount": vatAmount,
        "VATPercentage": vatPercentage,
    };
}

class FareBreakdown {
    String? currency;
    int? passengerType;
    int? passengerCount;
    double? totalFare;
    int? otherCharges;
    int? agentMarkup;
    int? serviceFee;
    double? baseFare;
    double? tax;
    int? penaltyAmount;
    int? creditCardCharge;
    List<TaxBreakUpList>? taxBreakUpList;
    int? vatAmount;
    int? vatPercentage;

    FareBreakdown({
        this.currency,
        this.passengerType,
        this.passengerCount,
        this.totalFare,
        this.otherCharges,
        this.agentMarkup,
        this.serviceFee,
        this.baseFare,
        this.tax,
        this.penaltyAmount,
        this.creditCardCharge,
        this.taxBreakUpList,
        this.vatAmount,
        this.vatPercentage,
    });

    factory FareBreakdown.fromRawJson(String str) => FareBreakdown.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FareBreakdown.fromJson(Map<String, dynamic> json) => FareBreakdown(
        currency: json["Currency"],
        passengerType: json["PassengerType"],
        passengerCount: json["PassengerCount"],
        totalFare: json["TotalFare"]?.toDouble(),
        otherCharges: json["OtherCharges"],
        agentMarkup: json["AgentMarkup"],
        serviceFee: json["ServiceFee"],
        baseFare: json["BaseFare"]?.toDouble(),
        tax: json["Tax"]?.toDouble(),
        penaltyAmount: json["PenaltyAmount"],
        creditCardCharge: json["CreditCardCharge"],
        taxBreakUpList: json["TaxBreakUpList"] == null ? [] : List<TaxBreakUpList>.from(json["TaxBreakUpList"]!.map((x) => TaxBreakUpList.fromJson(x))),
        vatAmount: json["VATAmount"],
        vatPercentage: json["VATPercentage"],
    );

    Map<String, dynamic> toJson() => {
        "Currency": currency,
        "PassengerType": passengerType,
        "PassengerCount": passengerCount,
        "TotalFare": totalFare,
        "OtherCharges": otherCharges,
        "AgentMarkup": agentMarkup,
        "ServiceFee": serviceFee,
        "BaseFare": baseFare,
        "Tax": tax,
        "PenaltyAmount": penaltyAmount,
        "CreditCardCharge": creditCardCharge,
        "TaxBreakUpList": taxBreakUpList == null ? [] : List<dynamic>.from(taxBreakUpList!.map((x) => x.toJson())),
        "VATAmount": vatAmount,
        "VATPercentage": vatPercentage,
    };
}

class TaxBreakUpList {
    String? type;
    double? amount;

    TaxBreakUpList({
        this.type,
        this.amount,
    });

    factory TaxBreakUpList.fromRawJson(String str) => TaxBreakUpList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TaxBreakUpList.fromJson(Map<String, dynamic> json) => TaxBreakUpList(
        type: json["Type"],
        amount: json["Amount"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "Type": type,
        "Amount": amount,
    };
}

class FareRule {
    String? origin;
    String? destination;
    String? airline;
    String? fareRestriction;
    String? fareBasisCode;
    dynamic fareFamilyCode;
    dynamic fareRuleDetail;
    dynamic fareRuleIndex;
    DateTime? departureDate;
    dynamic flightNumber;
    dynamic freeTextFareRuleDetail;

    FareRule({
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

    factory FareRule.fromRawJson(String str) => FareRule.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FareRule.fromJson(Map<String, dynamic> json) => FareRule(
        origin: json["Origin"],
        destination: json["Destination"],
        airline: json["Airline"],
        fareRestriction: json["FareRestriction"],
        fareBasisCode: json["FareBasisCode"],
        fareFamilyCode: json["FareFamilyCode"],
        fareRuleDetail: json["FareRuleDetail"],
        fareRuleIndex: json["FareRuleIndex"],
        departureDate: json["DepartureDate"] == null ? null : DateTime.parse(json["DepartureDate"]),
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

class Segment {
    int? segmentId;
    int? noOfSeatAvailable;
    String? allianceInfo;
    dynamic flightInfoIndex;
    String? operatingCarrier;
    int? segmentIndicator;
    String? airline;
    Destination? origin;
    Destination? destination;
    String? flightNumber;
    DateTime? departureTime;
    DateTime? arrivalTime;
    String? bookingClass;
    dynamic availabiLity;
    int? flightStatus;
    dynamic status;
    dynamic mealType;
    bool? eTicketEligible;
    dynamic airlinePnr;
    String? craft;
    bool? stopOver;
    int? stops;
    int? mile;
    String? duration;
    String? groundTime;
    String? accumulatedDuration;
    dynamic stopPoint;
    DateTime? stopPointArrivalTime;
    DateTime? stopPointDepartureTime;
    String? includedBaggage;
    String? cabinBaggage;
    String? cabinClass;
    dynamic additionalBaggage;
    AirlineDetails? airlineDetails;
    String? airlineName;
    dynamic departureDateTime;
    dynamic departureDate;
    dynamic arrivalDateTime;
    dynamic arrivalDate;
    dynamic layoverText;
    dynamic inFlightServices;
    String? fareFamilyClass;

    Segment({
        this.segmentId,
        this.noOfSeatAvailable,
        this.allianceInfo,
        this.flightInfoIndex,
        this.operatingCarrier,
        this.segmentIndicator,
        this.airline,
        this.origin,
        this.destination,
        this.flightNumber,
        this.departureTime,
        this.arrivalTime,
        this.bookingClass,
        this.availabiLity,
        this.flightStatus,
        this.status,
        this.mealType,
        this.eTicketEligible,
        this.airlinePnr,
        this.craft,
        this.stopOver,
        this.stops,
        this.mile,
        this.duration,
        this.groundTime,
        this.accumulatedDuration,
        this.stopPoint,
        this.stopPointArrivalTime,
        this.stopPointDepartureTime,
        this.includedBaggage,
        this.cabinBaggage,
        this.cabinClass,
        this.additionalBaggage,
        this.airlineDetails,
        this.airlineName,
        this.departureDateTime,
        this.departureDate,
        this.arrivalDateTime,
        this.arrivalDate,
        this.layoverText,
        this.inFlightServices,
        this.fareFamilyClass,
    });

    factory Segment.fromRawJson(String str) => Segment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        segmentId: json["SegmentId"],
        noOfSeatAvailable: json["NoOfSeatAvailable"],
        allianceInfo: json["AllianceInfo"],
        flightInfoIndex: json["FlightInfoIndex"],
        operatingCarrier: json["OperatingCarrier"],
        segmentIndicator: json["SegmentIndicator"],
        airline: json["Airline"],
        origin: json["Origin"] == null ? null : Destination.fromJson(json["Origin"]),
        destination: json["Destination"] == null ? null : Destination.fromJson(json["Destination"]),
        flightNumber: json["FlightNumber"],
        departureTime: json["DepartureTime"] == null ? null : DateTime.parse(json["DepartureTime"]),
        arrivalTime: json["ArrivalTime"] == null ? null : DateTime.parse(json["ArrivalTime"]),
        bookingClass: json["BookingClass"],
        availabiLity: json["AvailabiLity"],
        flightStatus: json["FlightStatus"],
        status: json["Status"],
        mealType: json["MealType"],
        eTicketEligible: json["ETicketEligible"],
        airlinePnr: json["AirlinePNR"],
        craft: json["Craft"],
        stopOver: json["StopOver"],
        stops: json["Stops"],
        mile: json["Mile"],
        duration: json["Duration"],
        groundTime: json["GroundTime"],
        accumulatedDuration: json["AccumulatedDuration"],
        stopPoint: json["StopPoint"],
        stopPointArrivalTime: json["StopPointArrivalTime"] == null ? null : DateTime.parse(json["StopPointArrivalTime"]),
        stopPointDepartureTime: json["StopPointDepartureTime"] == null ? null : DateTime.parse(json["StopPointDepartureTime"]),
        includedBaggage: json["IncludedBaggage"],
        cabinBaggage: json["CabinBaggage"],
        cabinClass: json["CabinClass"],
        additionalBaggage: json["AdditionalBaggage"],
        airlineDetails: json["AirlineDetails"] == null ? null : AirlineDetails.fromJson(json["AirlineDetails"]),
        airlineName: json["AirlineName"],
        departureDateTime: json["DepartureDateTime"],
        departureDate: json["DepartureDate"],
        arrivalDateTime: json["ArrivalDateTime"],
        arrivalDate: json["ArrivalDate"],
        layoverText: json["LayoverText"],
        inFlightServices: json["InFlightServices"],
        fareFamilyClass: json["FareFamilyClass"],
    );

    Map<String, dynamic> toJson() => {
        "SegmentId": segmentId,
        "NoOfSeatAvailable": noOfSeatAvailable,
        "AllianceInfo": allianceInfo,
        "FlightInfoIndex": flightInfoIndex,
        "OperatingCarrier": operatingCarrier,
        "SegmentIndicator": segmentIndicator,
        "Airline": airline,
        "Origin": origin?.toJson(),
        "Destination": destination?.toJson(),
        "FlightNumber": flightNumber,
        "DepartureTime": departureTime?.toIso8601String(),
        "ArrivalTime": arrivalTime?.toIso8601String(),
        "BookingClass": bookingClass,
        "AvailabiLity": availabiLity,
        "FlightStatus": flightStatus,
        "Status": status,
        "MealType": mealType,
        "ETicketEligible": eTicketEligible,
        "AirlinePNR": airlinePnr,
        "Craft": craft,
        "StopOver": stopOver,
        "Stops": stops,
        "Mile": mile,
        "Duration": duration,
        "GroundTime": groundTime,
        "AccumulatedDuration": accumulatedDuration,
        "StopPoint": stopPoint,
        "StopPointArrivalTime": stopPointArrivalTime?.toIso8601String(),
        "StopPointDepartureTime": stopPointDepartureTime?.toIso8601String(),
        "IncludedBaggage": includedBaggage,
        "CabinBaggage": cabinBaggage,
        "CabinClass": cabinClass,
        "AdditionalBaggage": additionalBaggage,
        "AirlineDetails": airlineDetails?.toJson(),
        "AirlineName": airlineName,
        "DepartureDateTime": departureDateTime,
        "DepartureDate": departureDate,
        "ArrivalDateTime": arrivalDateTime,
        "ArrivalDate": arrivalDate,
        "LayoverText": layoverText,
        "InFlightServices": inFlightServices,
        "FareFamilyClass": fareFamilyClass,
    };
}

class AirlineDetails {
    String? airlineCode;
    String? flightNumber;
    String? craft;
    String? airlineName;
    String? operatingCarrier;
    String? allianceInfo;

    AirlineDetails({
        this.airlineCode,
        this.flightNumber,
        this.craft,
        this.airlineName,
        this.operatingCarrier,
        this.allianceInfo,
    });

    factory AirlineDetails.fromRawJson(String str) => AirlineDetails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AirlineDetails.fromJson(Map<String, dynamic> json) => AirlineDetails(
        airlineCode: json["AirlineCode"],
        flightNumber: json["FlightNumber"],
        craft: json["Craft"],
        airlineName: json["AirlineName"],
        operatingCarrier: json["OperatingCarrier"],
        allianceInfo: json["AllianceInfo"],
    );

    Map<String, dynamic> toJson() => {
        "AirlineCode": airlineCode,
        "FlightNumber": flightNumber,
        "Craft": craft,
        "AirlineName": airlineName,
        "OperatingCarrier": operatingCarrier,
        "AllianceInfo": allianceInfo,
    };
}

class Destination {
    String? airportCode;
    String? airportName;
    String? cityCode;
    String? cityName;
    String? countryCode;
    String? countryName;
    String? terminal;

    Destination({
        this.airportCode,
        this.airportName,
        this.cityCode,
        this.cityName,
        this.countryCode,
        this.countryName,
        this.terminal,
    });

    factory Destination.fromRawJson(String str) => Destination.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        airportCode: json["AirportCode"],
        airportName: json["AirportName"],
        cityCode: json["CityCode"],
        cityName: json["CityName"],
        countryCode: json["CountryCode"],
        countryName: json["CountryName"],
        terminal: json["Terminal"],
    );

    Map<String, dynamic> toJson() => {
        "AirportCode": airportCode,
        "AirportName": airportName,
        "CityCode": cityCode,
        "CityName": cityName,
        "CountryCode": countryCode,
        "CountryName": countryName,
        "Terminal": terminal,
    };
}
