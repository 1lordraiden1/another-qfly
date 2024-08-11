// To parse this JSON data, do
//
//     final flightResponse = flightResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'flight_response.g.dart';

FlightResponse flightResponseFromJson(String str) => FlightResponse.fromJson(json.decode(str));

String flightResponseToJson(FlightResponse data) => json.encode(data.toJson());

@JsonSerializable()
class FlightResponse {
    @JsonKey(name: "accessToken")
    String? accessToken;
    @JsonKey(name: "version")
    String? version;
    @JsonKey(name: "serverDate")
    DateTime? serverDate;
    @JsonKey(name: "server")
    String? server;
    @JsonKey(name: "data")
    Data? data;
    @JsonKey(name: "error")
    Error? error;

    FlightResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
        this.error,
    });

    factory FlightResponse.fromJson(Map<String, dynamic> json) => _$FlightResponseFromJson(json);

    Map<String, dynamic> toJson() => _$FlightResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "class")
    String? dataClass;
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "status")
    Status? status;
    @JsonKey(name: "properties")
    DataProperties? properties;
    @JsonKey(name: "filters")
    Filters? filters;
    @JsonKey(name: "entities")
    List<Entity>? entities;
    @JsonKey(name: "links")
    List<Link>? links;

    Data({
        this.dataClass,
        this.type,
        this.status,
        this.properties,
        this.filters,
        this.entities,
        this.links,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Entity {
    @JsonKey(name: "itemId")
    String? itemId;
    @JsonKey(name: "hash")
    String? hash;
    @JsonKey(name: "price")
    EntityPrice? price;
    @JsonKey(name: "segments")
    List<Segment>? segments;
    @JsonKey(name: "properties")
    EntityProperties? properties;
    @JsonKey(name: "links")
    List<Link>? links;
    @JsonKey(name: "baggageAllowance")
    List<dynamic>? baggageAllowance;

    Entity({
        this.itemId,
        this.hash,
        this.price,
        this.segments,
        this.properties,
        this.links,
        this.baggageAllowance,
    });

    factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);

    Map<String, dynamic> toJson() => _$EntityToJson(this);
}

@JsonSerializable()
class Link {
    @JsonKey(name: "rel")
    String? rel;
    @JsonKey(name: "href")
    String? href;

    Link({
        this.rel,
        this.href,
    });

    factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

    Map<String, dynamic> toJson() => _$LinkToJson(this);
}

@JsonSerializable()
class EntityPrice {
    @JsonKey(name: "currency")
    String? currency;
    @JsonKey(name: "basePrice")
    double? basePrice;
    @JsonKey(name: "tax")
    double? tax;
    @JsonKey(name: "margin")
    int? margin;
    @JsonKey(name: "fees")
    int? fees;
    @JsonKey(name: "total")
    double? total;
    @JsonKey(name: "priceBreakDown")
    List<PriceBreakDown>? priceBreakDown;

    EntityPrice({
        this.currency,
        this.basePrice,
        this.tax,
        this.margin,
        this.fees,
        this.total,
        this.priceBreakDown,
    });

    factory EntityPrice.fromJson(Map<String, dynamic> json) => _$EntityPriceFromJson(json);

    Map<String, dynamic> toJson() => _$EntityPriceToJson(this);
}

@JsonSerializable()
class PriceBreakDown {
    @JsonKey(name: "currency")
    String? currency;
    @JsonKey(name: "PTC")
    String? ptc;
    @JsonKey(name: "count")
    int? count;
    @JsonKey(name: "basePrice")
    double? basePrice;
    @JsonKey(name: "tax")
    double? tax;
    @JsonKey(name: "margin")
    int? margin;
    @JsonKey(name: "total")
    double? total;
    @JsonKey(name: "taxBreakDown")
    List<dynamic>? taxBreakDown;

    PriceBreakDown({
        this.currency,
        this.ptc,
        this.count,
        this.basePrice,
        this.tax,
        this.margin,
        this.total,
        this.taxBreakDown,
    });

    factory PriceBreakDown.fromJson(Map<String, dynamic> json) => _$PriceBreakDownFromJson(json);

    Map<String, dynamic> toJson() => _$PriceBreakDownToJson(this);
}

@JsonSerializable()
class EntityProperties {
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "lcc")
    bool? lcc;
    @JsonKey(name: "privateFare")
    bool? privateFare;
    @JsonKey(name: "refundable")
    bool? refundable;
    @JsonKey(name: "platingCarrier")
    String? platingCarrier;
    @JsonKey(name: "ticketingDeadline")
    DateTime? ticketingDeadline;

    EntityProperties({
        this.type,
        this.lcc,
        this.privateFare,
        this.refundable,
        this.platingCarrier,
        this.ticketingDeadline,
    });

    factory EntityProperties.fromJson(Map<String, dynamic> json) => _$EntityPropertiesFromJson(json);

    Map<String, dynamic> toJson() => _$EntityPropertiesToJson(this);
}

@JsonSerializable()
class Segment {
    @JsonKey(name: "group")
    int? group;
    @JsonKey(name: "class")
    SegmentClass? segmentClass;
    @JsonKey(name: "carrier")
    Carrier? carrier;
    @JsonKey(name: "operatingCarrier")
    Carrier? operatingCarrier;
    @JsonKey(name: "origin")
    Destination? origin;
    @JsonKey(name: "destination")
    Destination? destination;
    @JsonKey(name: "techStops")
    int? techStops;
    @JsonKey(name: "equipment")
    dynamic equipment;
    @JsonKey(name: "flightTime")
    int? flightTime;
    @JsonKey(name: "journeyTime")
    int? journeyTime;

    Segment({
        this.group,
        this.segmentClass,
        this.carrier,
        this.operatingCarrier,
        this.origin,
        this.destination,
        this.techStops,
        this.equipment,
        this.flightTime,
        this.journeyTime,
    });

    factory Segment.fromJson(Map<String, dynamic> json) => _$SegmentFromJson(json);

    Map<String, dynamic> toJson() => _$SegmentToJson(this);
}

@JsonSerializable()
class Carrier {
    @JsonKey(name: "code")
    String? code;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "flightNumber")
    String? flightNumber;

    Carrier({
        this.code,
        this.name,
        this.flightNumber,
    });

    factory Carrier.fromJson(Map<String, dynamic> json) => _$CarrierFromJson(json);

    Map<String, dynamic> toJson() => _$CarrierToJson(this);
}

@JsonSerializable()
class Destination {
    @JsonKey(name: "code")
    String? code;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "date")
    DateTime? date;
    @JsonKey(name: "time")
    String? time;
    @JsonKey(name: "terminal")
    String? terminal;

    Destination({
        this.code,
        this.name,
        this.date,
        this.time,
        this.terminal,
    });

    factory Destination.fromJson(Map<String, dynamic> json) => _$DestinationFromJson(json);

    Map<String, dynamic> toJson() => _$DestinationToJson(this);
}

@JsonSerializable()
class SegmentClass {
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "code")
    String? code;
    @JsonKey(name: "bookingCode")
    dynamic bookingCode;
    @JsonKey(name: "availableSeats")
    int? availableSeats;
    @JsonKey(name: "originalname")
    String? originalname;

    SegmentClass({
        this.name,
        this.code,
        this.bookingCode,
        this.availableSeats,
        this.originalname,
    });

    factory SegmentClass.fromJson(Map<String, dynamic> json) => _$SegmentClassFromJson(json);

    Map<String, dynamic> toJson() => _$SegmentClassToJson(this);
}

@JsonSerializable()
class Filters {
    @JsonKey(name: "price")
    FiltersPrice? price;
    @JsonKey(name: "airlines")
    List<Airline>? airlines;
    @JsonKey(name: "class")
    FiltersClass? filtersClass;
    @JsonKey(name: "departure")
    Arrival? departure;
    @JsonKey(name: "arrival")
    Arrival? arrival;
    @JsonKey(name: "airports")
    Airports? airports;
    @JsonKey(name: "changes")
    List<Change>? changes;

    Filters({
        this.price,
        this.airlines,
        this.filtersClass,
        this.departure,
        this.arrival,
        this.airports,
        this.changes,
    });

    factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);

    Map<String, dynamic> toJson() => _$FiltersToJson(this);
}

@JsonSerializable()
class Airline {
    @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "value")
    String? value;

    Airline({
        this.id,
        this.value,
    });

    factory Airline.fromJson(Map<String, dynamic> json) => _$AirlineFromJson(json);

    Map<String, dynamic> toJson() => _$AirlineToJson(this);
}

@JsonSerializable()
class Airports {
    @JsonKey(name: "arrivals")
    List<Airline>? arrivals;
    @JsonKey(name: "departures")
    List<Airline>? departures;
    @JsonKey(name: "transfers")
    List<dynamic>? transfers;

    Airports({
        this.arrivals,
        this.departures,
        this.transfers,
    });

    factory Airports.fromJson(Map<String, dynamic> json) => _$AirportsFromJson(json);

    Map<String, dynamic> toJson() => _$AirportsToJson(this);
}

@JsonSerializable()
class Arrival {
    @JsonKey(name: "date")
    Date? date;
    @JsonKey(name: "landing")
    Date? landing;
    @JsonKey(name: "takeoff")
    Date? takeoff;

    Arrival({
        this.date,
        this.landing,
        this.takeoff,
    });

    factory Arrival.fromJson(Map<String, dynamic> json) => _$ArrivalFromJson(json);

    Map<String, dynamic> toJson() => _$ArrivalToJson(this);
}

@JsonSerializable()
class Date {
    @JsonKey(name: "min")
    String? min;
    @JsonKey(name: "max")
    String? max;

    Date({
        this.min,
        this.max,
    });

    factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

    Map<String, dynamic> toJson() => _$DateToJson(this);
}

@JsonSerializable()
class Change {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "value")
    String? value;

    Change({
        this.id,
        this.value,
    });

    factory Change.fromJson(Map<String, dynamic> json) => _$ChangeFromJson(json);

    Map<String, dynamic> toJson() => _$ChangeToJson(this);
}

@JsonSerializable()
class FiltersClass {
    @JsonKey(name: "-")
    String? empty;

    FiltersClass({
        this.empty,
    });

    factory FiltersClass.fromJson(Map<String, dynamic> json) => _$FiltersClassFromJson(json);

    Map<String, dynamic> toJson() => _$FiltersClassToJson(this);
}

@JsonSerializable()
class FiltersPrice {
    @JsonKey(name: "min")
    int? min;
    @JsonKey(name: "max")
    int? max;
    @JsonKey(name: "currency")
    String? currency;

    FiltersPrice({
        this.min,
        this.max,
        this.currency,
    });

    factory FiltersPrice.fromJson(Map<String, dynamic> json) => _$FiltersPriceFromJson(json);

    Map<String, dynamic> toJson() => _$FiltersPriceToJson(this);
}

@JsonSerializable()
class DataProperties {
    @JsonKey(name: "totalcount")
    int? totalcount;
    @JsonKey(name: "filteredcount")
    int? filteredcount;
    @JsonKey(name: "displaycount")
    int? displaycount;
    @JsonKey(name: "pages")
    int? pages;
    @JsonKey(name: "page")
    int? page;

    DataProperties({
        this.totalcount,
        this.filteredcount,
        this.displaycount,
        this.pages,
        this.page,
    });

    factory DataProperties.fromJson(Map<String, dynamic> json) => _$DataPropertiesFromJson(json);

    Map<String, dynamic> toJson() => _$DataPropertiesToJson(this);
}

@JsonSerializable()
class Status {
    @JsonKey(name: "percent")
    int? percent;
    @JsonKey(name: "finished")
    bool? finished;

    Status({
        this.percent,
        this.finished,
    });

    factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

    Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class Error {
    @JsonKey(name: "code")
    int? code;
    @JsonKey(name: "message")
    String? message;

    Error({
        this.code,
        this.message,
    });

    factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

    Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
