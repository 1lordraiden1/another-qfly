import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:qfly/data/model/Flight/Flight_details_model.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/data/model/hotel/hotel_model.dart';
import 'package:qfly/data/model/passenger_model.dart';
import 'package:qfly/data/model/airport_model.dart';
import 'package:qfly/data/model/room/room_data_model.dart';
import 'package:qfly/data/model/room/room_models/child_model.dart';
import 'package:qfly/data/services/home_services.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeCubit extends Bloc<HomeEvent, HomeState> {
  HomeCubit() : super(HomeInitial());

  // Global

  // Dio

  Dio dio = Dio()
    ..interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Print the original request URL
        print("Original Request URL: ${options.uri}");

        print(options.data);

        // Modify the query parameters manually to prevent URL encoding
        /*  final modifiedQueryParameters =
            Map<String, dynamic>.from(options.queryParameters);
        modifiedQueryParameters.forEach((key, value) {
          if (key == "children_ages") {
            modifiedQueryParameters[key] = Uri.decodeComponent(value);
          }
          if (value is String && value.contains('%2C')) {
            modifiedQueryParameters[key] = Uri.decodeComponent(value);
          }
        });

        // Rebuild the request URL with modified query parameters
        options.queryParameters = modifiedQueryParameters;

        // Print the modified request URL
        print("Modified Request URL: ${options.uri}");

        return handler.next(options); */
      },
      onResponse: (response, handler) {
        print("Response : ${response.data}");
        // Optionally log response
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print("Request Error: ${e.message}");
        return handler.next(e);
      },
    ));

  // Home Data

  int topFlightCurrentItem = 0;

  changeTopFlightIndex(int index) {
    topFlightCurrentItem = index;
    emit(TopFlightItemIsChanged(index));
  }

  int _serviceIndex = 0;
  int get serviceIndex => _serviceIndex;
  selectService(int index, BuildContext context) {
    _serviceIndex = index;

    //_handleServiceAction(context);
    emit(ServiceIsChanged(index));
  }

  /*  _handleServiceAction(context) {
    if (_serviceIndex == 0) {
      Navigator.pushNamed(context, Routes.flightListRoute);
    } else if (_serviceIndex == 2) {
      Navigator.pushNamed(context, Routes.selectHotelRoute);
    }
  } */

  // Flight Data

  // Init
  /*  static List<Country> _countries = []; */
  static List<Airport> _airports = [];
  static List<Airport> _popularAirports = [];
  final List<String> _classTypes = ['Economy', 'Second Class', 'First Class'];
  static List<Flight> _flights = [];

  static String _whereFrom = "Where From?";
  static String _whereTo = "Where To?";

  DateTime _flightDate = DateTime.now();
  DateTime _flightBirthDate = DateTime.now();

  int _adults = 1;
  int _children = 0;
  int _infant = 0;

  Airport _selectedWhereFrom = Airport.empty();
  Airport _selectedWhereTo = Airport.empty();

  Map<String, dynamic> _booking = {};
  Map<String, dynamic> _details = {};
  FareQuote _fareQuote = FareQuote.empty();

  int _selectedClassType = 0;

  bool isSearchDataLoading = false;
  bool isSearchFlightLoading = false;
  bool isSearchFlightDetailsLoading = false;
  bool isStillBooking = false;

  bool _isDirect = false;

  Map<String, dynamic> _ticketData = {};

  Map<String, dynamic> _bookedTicket = {};

  List<Passenger> _passengers = [];

  // Getters
  String get whereFrom => _whereFrom;
  String get whereTo => _whereTo;
  Airport get airportFrom => _selectedWhereFrom;
  Airport get airportTo => _selectedWhereTo;

  Map<String, dynamic> get details => _details;
  Map<String, dynamic> get booking => _booking;
  FareQuote get fareQuote => _fareQuote;

  DateTime get flightDate => _flightDate;
  DateTime get flightBirthDate => _flightBirthDate;

  /*  List<Country> get countries => _countries; */

  bool get isDirect => _isDirect;

  int get selectedClassType => _selectedClassType;

  int get adults => _adults;
  int get children => _children;
  int get infant => _infant;

  Future<List<Airport>> get futureAirport async => _airports;
  List<Airport> get popularAirports => _popularAirports;
  List<Airport> get airport => _airports;
  List<String> get classTypes => _classTypes;
  List<Flight> get flight => _flights;

  Map<String, dynamic> get ticketData => _ticketData;
  Map<String, dynamic> get bookedTicket => _bookedTicket;

  List<Passenger> get passengers => _passengers;

  // Flight Functions
/* 
  FutureOr<void> handleWhereFromChanging(Country country) {
    _whereFrom = country.name;
    _iconFrom = country.icon;
    emit(
      ChangeWhereFromWidgetData(
        whereFrom: country.name,
        iconFrom: country.icon,
      ),
    );
  }

  handleWhereToChanging(Country country) {
    _whereTo = country.name;
    _iconTo = country.icon;
    emit(
      ChangeWhereToWidgetData(
        whereTo: country.name,
        iconTo: country.icon,
      ),
    );
  } */

/*   getCountries() async {
    final homeServices = HomeServices();
    _countries = await homeServices.getCountries();
    emit(HomeLoadCountries(_countries)); // last
  }

  FutureOr<void> changeWhereFromEvent(
      ChangeWhereFromEvent event, Emitter<HomeState> emit) async {
    emit(
      ChangeWhereFromWidgetData(
        whereFrom: event.wf,
        iconFrom: event.iconf,
      ),
    );
  } */

  getAirportsData(String searchValue) async {
    try {
      isSearchDataLoading = true;

      final initData = await HomeServices().fetchAirportsData('dx');

      _popularAirports = initData
          .map(
            (e) => Airport.fromJson(e),
          )
          .toList();

      final data = await HomeServices().fetchAirportsData(searchValue);

      _airports = data
          .map(
            (e) => Airport.fromJson(e),
          )
          .toList();

      emit(AirportDataImportedSuccessfully(
          airports: _airports, popularAirports: _popularAirports));
    } catch (e) {
      isSearchDataLoading = false;
      throw Exception('Failed to load airports from HomeCubit');
    } finally {
      isSearchDataLoading = false;
    }
  }

  selectingAirport(Airport a, bool isWhereFrom) {
    isWhereFrom ? _selectedWhereFrom = a : _selectedWhereTo = a;

    emit(SelectingAirportState(
      airportUpdate: isWhereFrom ? _selectedWhereFrom : _selectedWhereTo,
    ));
  }

  switchAirports() {
    Airport temp = _selectedWhereFrom;
    _selectedWhereFrom = _selectedWhereTo;
    _selectedWhereTo = temp;

    emit(SwitchCAirportsState(
      a1: _selectedWhereFrom,
      a2: _selectedWhereTo,
    ));
  }

  handleFlightDateChanging(DateTime date) {
    _flightDate = date;
    emit(ChangeCheckInDate(checkIn: _flightDate));
  }

  handleFlightBirthDateChanging(DateTime date) {
    _flightBirthDate = date;
    emit(ChangeFlightBirthDateState(date: _flightBirthDate));
  }

  handleDirectFlightChanging(bool value) {
    _isDirect = value;
    emit(ChangingFlightDirectState(isDirect: _isDirect));
  }

  handleFlightAdultsChanges(int adultCount, String operation) {
    if (operation == '+') {
      if (adultCount < 5) {
        adultCount++;
      }
    } else {
      if (adultCount > 1) {
        adultCount--;
      }
    }
    _adults = adultCount;
    emit(ChangeFlightAdults(adults: _adults));
  }

  handleFlightChildrenChanges(int childCount, String operation) {
    if (operation == '+') {
      if (childCount < 5) {
        childCount++;
      }
    } else {
      if (childCount > 0) {
        childCount--;
      }
    }
    _children = childCount;
    emit(ChangeFlightChildren(children: _children));
  }

  handleFlightInfantChanges(int childCount, String operation) {
    if (operation == '+') {
      if (childCount < 5) {
        childCount++;
      }
    } else {
      if (childCount > 0) {
        childCount--;
      }
    }
    _infant = childCount;
    emit(ChangeFlightInfants(infants: _infant));
  }

  handleClassTypeSelection(String type) {
    switch (type) {
      case 'Economy':
        _selectedClassType = 0;
        break;

      case 'Second Class':
        _selectedClassType = 1;
        break;

      default:
        _selectedClassType = 2;
    }
    emit(ClassTypeSelectionState(selectedClassType: _selectedClassType));
  }

  handleSearchingForFlights(
    String pointOfSale,
    String origin,
    String destination,
    int adultCount,
    int childCount,
    int infantCount,
    int classType,
    DateTime departureTime,
    bool isDirect,
  ) async {
    isSearchFlightLoading = true;
    try {
      final List<Map<String, dynamic>> data =
          await HomeServices().searchForFlights(
        pointOfSale,
        origin,
        destination,
        adultCount,
        childCount,
        infantCount,
        classType,
        departureTime,
        isDirect,
      );

      if (data[0]['errors'] != null) {
        isSearchFlightLoading = false;
        print(data[0]['errors'].toString());
        data[0]['errors'];
        emit(NoDataFoundState());
        return;
      }

      _flights = data
          .map(
            (e) => Flight.fromJson(e),
          )
          .toList();

      emit(SearchingFlightState(flights: _flights));
    } catch (e) {
      onError(e, StackTrace.current);
      emit(NoDataFoundState());
      //throw Exception(e.toString());
    } finally {
      isSearchFlightLoading = false;
    }
  }

  handleGettingFlightDetails(
    String pointOfSale,
    String origin,
    String resultId,
    bool isLcc,
    String companyName,
  ) async {
    isSearchFlightDetailsLoading = true;
    try {
      final Map<String, dynamic> data =
          await HomeServices().searchForFlightDetails(
        pointOfSale,
        origin,
        resultId,
        isLcc,
        companyName,
      );

      if (data['errors'] != null) {
        isSearchFlightDetailsLoading = false;
        print(data['errors'].toString());
        data['errors'];
        emit(NoDataFoundState());
        return;
      }

      if (data['status'] == 403) {
        isSearchFlightDetailsLoading = false;
        print(data['massage'].toString());
        emit(NoDataFoundState());
        return;
      }
      _details = data;

      _fareQuote = FareQuote.fromJson(data);

      emit(GettingFlightDetailsState(details: _fareQuote));
    } catch (e) {
      isSearchFlightDetailsLoading = false;
      emit(GettingAlreadyBookedTicketState());
      onError(e, StackTrace.current);

      //throw Exception(e.toString());
    } finally {
      isSearchFlightDetailsLoading = false;
    }
  }

  handleGettingTicketDetails({
    required Map<String, dynamic> fare,
    required Map<String, dynamic> fareRules,
    required List<dynamic> segment,
    required String pointOfSale,
    required String origin,
    required String resultId,
    required String companyName,
    required bool isLcc,
    required String originAirportCode,
    required String desAirportCode,
    required String airlineCode,
    required String responseTime,
  }) async {
    isSearchFlightDetailsLoading = true;

    try {
      final Map<String, dynamic> data =
          await HomeServices().gettingTicketWhenLCCisTrue(
        fare,
        fareRules,
        segment,
        pointOfSale,
        origin,
        resultId,
        companyName,
        isLcc,
        originAirportCode,
        desAirportCode,
        airlineCode,
        responseTime,
      );

      if (data['errors'] != null) {
        isSearchFlightDetailsLoading = false;
        print(data['errors'].toString());
        data['errors'];
        emit(NoDataFoundState());
        return;
      }

      if (data['status'] == 403) {
        isSearchFlightDetailsLoading = false;
        print(data['massage'].toString());
        emit(NoDataFoundState());
        return;
      }

      _ticketData = data;

      emit(GettingTicketDetailsState(ticketData: _ticketData));
    } catch (e) {
      onError(e, StackTrace.current);

      //throw Exception(e.toString());
    } finally {
      isSearchFlightDetailsLoading = false;
    }
  }

  handleBookingTicketProcess({
    required Map<String, dynamic> fare,
    required Map<String, dynamic> fareRules,
    required List<dynamic> segment,
    required String pointOfSale,
    required String origin,
    required String resultId,
    required String companyName,
    required bool isLcc,
    required String originAirportCode,
    required String desAirportCode,
    required String airlineCode,
    required String responseTime,
    required String userSearchTime,
    required String lastTicketDate,
    required String ticketAdvisory,
  }) async {
    isStillBooking = true;

    try {
      final Map<String, dynamic> data =
          await HomeServices().gettingBookingWhenLCCisFalse(
        fare,
        fareRules,
        segment,
        pointOfSale,
        origin,
        resultId,
        companyName,
        isLcc,
        originAirportCode,
        desAirportCode,
        airlineCode,
        responseTime,
        userSearchTime,
        lastTicketDate,
        ticketAdvisory,
      );

      if (data['errors'] != null) {
        isStillBooking = false;
        print(data['errors'].toString());
        data['errors'];
        emit(NoDataFoundState());
        return;
      }

      if (data['status'] == 403) {
        isStillBooking = false;
        print(data['massage'].toString());
        emit(NoDataFoundState());
        return;
      }

      _ticketData = data;

      emit(GettingTicketDetailsState(ticketData: _ticketData));

      handleGettingBookedTicketProcess(
        fare: details['fareQuote']['Result'][0]['Fare'],
        fareRules: details['fareQuote']['Result'][0]['FareRules'][0],
        segment: details['fareQuote']['Result'][0]['Segments'][0],
        airlineCode: details['fareQuote']['Result'][0]['ValidatingAirline'],
        companyName: companyName,
        desAirportCode: details['fareQuote']['Result'][0]['Destination'],
        isLcc: details['fareQuote']['Result'][0]['IsLcc'],
        origin: origin,
        originAirportCode: details['fareQuote']['Result'][0]['Origin'],
        pointOfSale: origin,
        responseTime: details['fareQuote']['Result'][0]['ResponseTime'],
        resultId: details['fareQuote']['Result'][0]['ResultId'],
        lastTicketDate: details['fareQuote']['Result'][0]['LastTicketDate'],
        ticketAdvisory: details['fareQuote']['Result'][0]['TicketAdvisory'],
        userSearchTime: flightDate.toString().substring(0, 10),
        createOn: ticketData['Itinerary']['CreatedOn'],
        pnr: ticketData['Itinerary']['PNR'],
      );
    } catch (e) {
      isStillBooking = false;
      emit(GettingAlreadyBookedTicketState());
      onError(e, StackTrace.current);

      //throw Exception(e.toString());
    } finally {
      isStillBooking = false;
    }
  }

  handleGettingBookedTicketProcess({
    required Map<String, dynamic> fare,
    required Map<String, dynamic> fareRules,
    required List<dynamic> segment,
    required String pointOfSale,
    required String origin,
    required String resultId,
    required String companyName,
    required bool isLcc,
    required String originAirportCode,
    required String desAirportCode,
    required String airlineCode,
    required String responseTime,
    required String userSearchTime,
    required String lastTicketDate,
    required String ticketAdvisory,
    required String createOn,
    required String pnr,
  }) async {
    isSearchFlightDetailsLoading = true;

    try {
      final Map<String, dynamic> data =
          await HomeServices().gettingTicketWhenLCCisFalse(
        fare,
        fareRules,
        segment,
        pointOfSale,
        origin,
        resultId,
        companyName,
        isLcc,
        originAirportCode,
        desAirportCode,
        airlineCode,
        responseTime,
        userSearchTime,
        lastTicketDate,
        ticketAdvisory,
        createOn,
        pnr,
      );

      if (data['errors'] != null) {
        isSearchFlightDetailsLoading = false;
        print(data['errors'].toString());
        data['errors'];
        emit(NoDataFoundState());
        return;
      }

      if (data['status'] == 403) {
        isSearchFlightDetailsLoading = false;
        print(data['massage'].toString());
        emit(NoDataFoundState());
        return;
      }

      _bookedTicket = data;

      emit(GettingBookedTicketState(bookedTicket: _bookedTicket));
    } catch (e) {
      onError(e, StackTrace.current);

      //throw Exception(e.toString());
    } finally {
      isSearchFlightDetailsLoading = false;
    }
  }

  createPassengers(int passengersCount) {
    _passengers = List<Passenger>.generate(
      passengersCount,
      (index) {
        return Passenger.empty();
      },
    );
    emit(CreatingPassengersState(passengers: _passengers));
  }

  // Hotel Data
  // Init

  final DateTime _checkInDate = DateTime.now();
  final DateTime _checkOutDate = DateTime(2025);

  List<City> _cities = [];
  List<Country> _countries = [];
  Country _country = Country.empty();
  City _city = City.empty();

  int _rooms = 1;

  List<RoomData> _hotelRooms = [
    RoomData.emptyWithId(1),
  ];

  List<Hotel> _hotels = [];

  // Getters (Can't Set Data!)

  DateTime get checkInDate => _checkInDate;
  DateTime get checkOutDate => _checkOutDate;

  List<City> get cities => _cities;
  List<Country> get countries => _countries;
  Country get country => _country;
  City get city => _city;

  int get rooms => _rooms;

  List<RoomData> get hotelRooms => _hotelRooms;
  List<Hotel> get hotels => _hotels;

  // Loading

  bool isSearchCityLoading = false;

  bool isSearchHotelsLoading = false;

  // Hotel Functions
  handleCheckInDateChanging(DateTime checkIn) {
    emit(ChangeCheckInDate(checkIn: checkIn));
  }

  handleCheckOutDateChanging(DateTime checkOut) {
    emit(ChangeCheckInDate(checkIn: checkOut));
  }

  handleAdultsChanges(RoomData room, String operation) {
    if (operation == '+') {
      if (room.adults < 5) {
        room.adults++;
      }
    } else {
      if (room.adults > 1) {
        room.adults--;
      }
    }
    emit(ChangeAdults(room: room));
  }

  handleChildrenChanges(RoomData room, String operation) {
    if (operation == '+') {
      if (room.children < 5) {
        room.children++;
      }
    } else {
      if (room.children > 0) {
        room.children--;
      }
    }
    emit(ChangeChildren(room: room));
  }

  handleRoomsChanges(int r, String operation) {
    _rooms = r;
    if (operation == '+') {
      _rooms++;
    } else {
      _rooms--;
    }
    emit(ChangeRooms(rooms: _rooms));
  }

  handleHotelChildrenChanges(Child child, String operation) {
    /// for age
    if (operation == '+') {
      if (child.age < 11) {
        child.age++;
      }
    } else {
      if (child.age > 2) {
        child.age--;
      }
    }
    emit(ChangeHotelChildren(child: child));
  }

  handleHotelSelection(Country country) {
    _country = country;
    _city = City.empty();
    _cities = [];
    searchCityHandler();
    emit(
      HotelSelectionChanging(country: _country),
    );
  }

  handleHotelCitySelection(City c) {
    _city = c;
    emit(
      HotelCitySelectionChanging(city: _city),
    );
  }

  handleHotelRoomSelection(int r) {
    for (int i = _hotelRooms.length - 1; i < r; i++) {
      _hotelRooms.add(
        RoomData.emptyWithId(_hotelRooms.length + 1),
      );
      print('Item No' + i.toString() + 'Created');
      print('This is list' + _hotelRooms.length.toString());

      print(r);
    }
    emit(hotelRoomsState(hotelRooms: _hotelRooms));
  }

  handleHotelChildSelection(RoomData room, int c) {
    for (int i = room.childs.length - 2; i < c; i++) {
      room.childs!.add(
        Child.emptyWithId(room.childs.length + 1),
      );
      print(
        'Item No' + i.toString() + 'Created',
      );
      print(
        'This is list' + room.childs.length.toString(),
      );

      print(c);
    }
    emit(hotelChildrenState(hotelChildren: room.childs));
  }

  searchCountryHandler() async {
    try {
      isSearchDataLoading = true;

      final data = await HomeServices().fetchCountriesData();

      _countries = data
          .map(
            (e) => Country.fromHotelJson(e),
          )
          .toList();

      emit(LoadCountriesState(countries: _countries));
    } catch (e) {
      isSearchDataLoading = false;
      onError(e, StackTrace.current);
    } finally {
      isSearchDataLoading = false;
    }
  }

  searchCityHandler() async {
    try {
      isSearchCityLoading = true;

      final data = await HomeServices().fetchCitiesData(
        country.countryCode.toString(),
      );

      _cities = data
          .map(
            (e) => City.fromHotelJson(e),
          )
          .toList();

      emit(LoadCitiesState(cities: _cities));
    } catch (e) {
      isSearchCityLoading = false;
      onError(e, StackTrace.current);
    } finally {
      isSearchCityLoading = false;
    }
  }

  /* searchHotelsHandler(
    String cityCode,
    DateTime checkIn,
    DateTime checkOut,
    String adults,
    String children,
    String childrenAges,
    List<int> ages,
    bool refundable,
    String mealType,
    String guestNationality,
  ) async {
    isSearchHotelsLoading = true;

    //dart.dev/diagnostics/return_of_invalid_type_from_closure
    final queryParams = Utility.convertJsonToQueryParams(
      {
        'city': '100639',
        'check_in': '2024-08-27',
        'check_out': '2024-08-28',
        'adults': '2',
        'children': children,
        'children_ages':"$ages",
        'refundable': 'true',
        'nom_room': '0',
        'meal_type': 'all',
        'page': '1',
        'per_page': '5',
        'guestNationality': 'EG'
      },
    ); /* Utility.convertJsonToQueryParams(
      {
        'city': '100639',
        'check_in': '2024-08-27',
        'check_out': '2024-08-28',
        'adults': '2',
        'children': '2',
        'children_ages': [4,5],
        'refundable': 'true',
        'nom_room': '0',
        'meal_type': 'all',
        'page': '1',
        'per_page': '5',
        'guestNationality': 'EG'
      },
    ); */

    print(queryParams);

    try {
      final ApiResponse data = await ApiServices(dio).getHotels(
        queryParams,
        await SharedPreferencesUtil.getAuthToken('authToken') ??
            await AuthService().authMe(),
      );

      if (data.data == null || data.status == 201) {
        isSearchHotelsLoading = false;
        print(data.errors!["description"].toString());
        data.errors;
        emit(NoHotelDataFoundState(error: data.errors!["Description"]));
        return;
      }

      _hotels = data.data!.data!;

      print(_hotels);

      emit(LoadHotelsState(hotels: _hotels));
    } catch (e) {
      isSearchHotelsLoading = false;
      onError(e, StackTrace.current);
      emit(NoDataFoundState());
      //throw Exception(e.toString());
    } finally {
      isSearchHotelsLoading = false;
    }
  } */
}
