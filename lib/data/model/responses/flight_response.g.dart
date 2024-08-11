// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightResponse _$FlightResponseFromJson(Map<String, dynamic> json) =>
    FlightResponse(
      accessToken: json['accessToken'] as String?,
      version: json['version'] as String?,
      serverDate: json['serverDate'] == null
          ? null
          : DateTime.parse(json['serverDate'] as String),
      server: json['server'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlightResponseToJson(FlightResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'version': instance.version,
      'serverDate': instance.serverDate?.toIso8601String(),
      'server': instance.server,
      'data': instance.data,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      dataClass: json['class'] as String?,
      type: json['type'] as String?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      properties: json['properties'] == null
          ? null
          : DataProperties.fromJson(json['properties'] as Map<String, dynamic>),
      filters: json['filters'] == null
          ? null
          : Filters.fromJson(json['filters'] as Map<String, dynamic>),
      entities: (json['entities'] as List<dynamic>?)
          ?.map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'class': instance.dataClass,
      'type': instance.type,
      'status': instance.status,
      'properties': instance.properties,
      'filters': instance.filters,
      'entities': instance.entities,
      'links': instance.links,
    };

Entity _$EntityFromJson(Map<String, dynamic> json) => Entity(
      itemId: json['itemId'] as String?,
      hash: json['hash'] as String?,
      price: json['price'] == null
          ? null
          : EntityPrice.fromJson(json['price'] as Map<String, dynamic>),
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) => Segment.fromJson(e as Map<String, dynamic>))
          .toList(),
      properties: json['properties'] == null
          ? null
          : EntityProperties.fromJson(
              json['properties'] as Map<String, dynamic>),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      baggageAllowance: json['baggageAllowance'] as List<dynamic>?,
    );

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'hash': instance.hash,
      'price': instance.price,
      'segments': instance.segments,
      'properties': instance.properties,
      'links': instance.links,
      'baggageAllowance': instance.baggageAllowance,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      rel: json['rel'] as String?,
      href: json['href'] as String?,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'rel': instance.rel,
      'href': instance.href,
    };

EntityPrice _$EntityPriceFromJson(Map<String, dynamic> json) => EntityPrice(
      currency: json['currency'] as String?,
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      margin: (json['margin'] as num?)?.toInt(),
      fees: (json['fees'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toDouble(),
      priceBreakDown: (json['priceBreakDown'] as List<dynamic>?)
          ?.map((e) => PriceBreakDown.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EntityPriceToJson(EntityPrice instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'basePrice': instance.basePrice,
      'tax': instance.tax,
      'margin': instance.margin,
      'fees': instance.fees,
      'total': instance.total,
      'priceBreakDown': instance.priceBreakDown,
    };

PriceBreakDown _$PriceBreakDownFromJson(Map<String, dynamic> json) =>
    PriceBreakDown(
      currency: json['currency'] as String?,
      ptc: json['PTC'] as String?,
      count: (json['count'] as num?)?.toInt(),
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      margin: (json['margin'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toDouble(),
      taxBreakDown: json['taxBreakDown'] as List<dynamic>?,
    );

Map<String, dynamic> _$PriceBreakDownToJson(PriceBreakDown instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'PTC': instance.ptc,
      'count': instance.count,
      'basePrice': instance.basePrice,
      'tax': instance.tax,
      'margin': instance.margin,
      'total': instance.total,
      'taxBreakDown': instance.taxBreakDown,
    };

EntityProperties _$EntityPropertiesFromJson(Map<String, dynamic> json) =>
    EntityProperties(
      type: json['type'] as String?,
      lcc: json['lcc'] as bool?,
      privateFare: json['privateFare'] as bool?,
      refundable: json['refundable'] as bool?,
      platingCarrier: json['platingCarrier'] as String?,
      ticketingDeadline: json['ticketingDeadline'] == null
          ? null
          : DateTime.parse(json['ticketingDeadline'] as String),
    );

Map<String, dynamic> _$EntityPropertiesToJson(EntityProperties instance) =>
    <String, dynamic>{
      'type': instance.type,
      'lcc': instance.lcc,
      'privateFare': instance.privateFare,
      'refundable': instance.refundable,
      'platingCarrier': instance.platingCarrier,
      'ticketingDeadline': instance.ticketingDeadline?.toIso8601String(),
    };

Segment _$SegmentFromJson(Map<String, dynamic> json) => Segment(
      group: (json['group'] as num?)?.toInt(),
      segmentClass: json['class'] == null
          ? null
          : SegmentClass.fromJson(json['class'] as Map<String, dynamic>),
      carrier: json['carrier'] == null
          ? null
          : Carrier.fromJson(json['carrier'] as Map<String, dynamic>),
      operatingCarrier: json['operatingCarrier'] == null
          ? null
          : Carrier.fromJson(json['operatingCarrier'] as Map<String, dynamic>),
      origin: json['origin'] == null
          ? null
          : Destination.fromJson(json['origin'] as Map<String, dynamic>),
      destination: json['destination'] == null
          ? null
          : Destination.fromJson(json['destination'] as Map<String, dynamic>),
      techStops: (json['techStops'] as num?)?.toInt(),
      equipment: json['equipment'],
      flightTime: (json['flightTime'] as num?)?.toInt(),
      journeyTime: (json['journeyTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SegmentToJson(Segment instance) => <String, dynamic>{
      'group': instance.group,
      'class': instance.segmentClass,
      'carrier': instance.carrier,
      'operatingCarrier': instance.operatingCarrier,
      'origin': instance.origin,
      'destination': instance.destination,
      'techStops': instance.techStops,
      'equipment': instance.equipment,
      'flightTime': instance.flightTime,
      'journeyTime': instance.journeyTime,
    };

Carrier _$CarrierFromJson(Map<String, dynamic> json) => Carrier(
      code: json['code'] as String?,
      name: json['name'] as String?,
      flightNumber: json['flightNumber'] as String?,
    );

Map<String, dynamic> _$CarrierToJson(Carrier instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'flightNumber': instance.flightNumber,
    };

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
      code: json['code'] as String?,
      name: json['name'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      time: json['time'] as String?,
      terminal: json['terminal'] as String?,
    );

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'date': instance.date?.toIso8601String(),
      'time': instance.time,
      'terminal': instance.terminal,
    };

SegmentClass _$SegmentClassFromJson(Map<String, dynamic> json) => SegmentClass(
      name: json['name'] as String?,
      code: json['code'] as String?,
      bookingCode: json['bookingCode'],
      availableSeats: (json['availableSeats'] as num?)?.toInt(),
      originalname: json['originalname'] as String?,
    );

Map<String, dynamic> _$SegmentClassToJson(SegmentClass instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'bookingCode': instance.bookingCode,
      'availableSeats': instance.availableSeats,
      'originalname': instance.originalname,
    };

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
      price: json['price'] == null
          ? null
          : FiltersPrice.fromJson(json['price'] as Map<String, dynamic>),
      airlines: (json['airlines'] as List<dynamic>?)
          ?.map((e) => Airline.fromJson(e as Map<String, dynamic>))
          .toList(),
      filtersClass: json['class'] == null
          ? null
          : FiltersClass.fromJson(json['class'] as Map<String, dynamic>),
      departure: json['departure'] == null
          ? null
          : Arrival.fromJson(json['departure'] as Map<String, dynamic>),
      arrival: json['arrival'] == null
          ? null
          : Arrival.fromJson(json['arrival'] as Map<String, dynamic>),
      airports: json['airports'] == null
          ? null
          : Airports.fromJson(json['airports'] as Map<String, dynamic>),
      changes: (json['changes'] as List<dynamic>?)
          ?.map((e) => Change.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'price': instance.price,
      'airlines': instance.airlines,
      'class': instance.filtersClass,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'airports': instance.airports,
      'changes': instance.changes,
    };

Airline _$AirlineFromJson(Map<String, dynamic> json) => Airline(
      id: json['id'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$AirlineToJson(Airline instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

Airports _$AirportsFromJson(Map<String, dynamic> json) => Airports(
      arrivals: (json['arrivals'] as List<dynamic>?)
          ?.map((e) => Airline.fromJson(e as Map<String, dynamic>))
          .toList(),
      departures: (json['departures'] as List<dynamic>?)
          ?.map((e) => Airline.fromJson(e as Map<String, dynamic>))
          .toList(),
      transfers: json['transfers'] as List<dynamic>?,
    );

Map<String, dynamic> _$AirportsToJson(Airports instance) => <String, dynamic>{
      'arrivals': instance.arrivals,
      'departures': instance.departures,
      'transfers': instance.transfers,
    };

Arrival _$ArrivalFromJson(Map<String, dynamic> json) => Arrival(
      date: json['date'] == null
          ? null
          : Date.fromJson(json['date'] as Map<String, dynamic>),
      landing: json['landing'] == null
          ? null
          : Date.fromJson(json['landing'] as Map<String, dynamic>),
      takeoff: json['takeoff'] == null
          ? null
          : Date.fromJson(json['takeoff'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArrivalToJson(Arrival instance) => <String, dynamic>{
      'date': instance.date,
      'landing': instance.landing,
      'takeoff': instance.takeoff,
    };

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      min: json['min'] as String?,
      max: json['max'] as String?,
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

Change _$ChangeFromJson(Map<String, dynamic> json) => Change(
      id: (json['id'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ChangeToJson(Change instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

FiltersClass _$FiltersClassFromJson(Map<String, dynamic> json) => FiltersClass(
      empty: json['-'] as String?,
    );

Map<String, dynamic> _$FiltersClassToJson(FiltersClass instance) =>
    <String, dynamic>{
      '-': instance.empty,
    };

FiltersPrice _$FiltersPriceFromJson(Map<String, dynamic> json) => FiltersPrice(
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$FiltersPriceToJson(FiltersPrice instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'currency': instance.currency,
    };

DataProperties _$DataPropertiesFromJson(Map<String, dynamic> json) =>
    DataProperties(
      totalcount: (json['totalcount'] as num?)?.toInt(),
      filteredcount: (json['filteredcount'] as num?)?.toInt(),
      displaycount: (json['displaycount'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataPropertiesToJson(DataProperties instance) =>
    <String, dynamic>{
      'totalcount': instance.totalcount,
      'filteredcount': instance.filteredcount,
      'displaycount': instance.displaycount,
      'pages': instance.pages,
      'page': instance.page,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      percent: (json['percent'] as num?)?.toInt(),
      finished: json['finished'] as bool?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'percent': instance.percent,
      'finished': instance.finished,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
