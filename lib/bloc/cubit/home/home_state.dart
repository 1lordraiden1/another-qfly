part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

const int index = 0;

class ServiceIsChanged extends HomeState {
  final int index;
  ServiceIsChanged(this.index);
}

class TopFlightItemIsChanged extends HomeState {
  final int index;
  TopFlightItemIsChanged(this.index);
}

class ChangeWhereFromWidgetData extends HomeState {
  final String whereFrom;
  final String iconFrom;
  ChangeWhereFromWidgetData({
    required this.whereFrom,
    required this.iconFrom,
  });
}

class WhereFromState extends HomeState {}

class WhereToState extends HomeState {}

class ChangeCheckInDate extends HomeState {
  final DateTime checkIn;

  ChangeCheckInDate({required this.checkIn});
}

class ChangeFlightBirthDateState extends HomeState {
  final DateTime _date;

  ChangeFlightBirthDateState({
    required DateTime date,
  }) : _date = date;
}

class ChangeAdults extends HomeState {
  final RoomData _room;

  ChangeAdults({required RoomData room}) : _room = room;
}

/* class ChangeAdults extends HomeState { 
  final int adults;

  ChangeAdults({required this.adults});
} */
class DecreaseAdults extends HomeState {}

class ChangeChildren extends HomeState {
  final RoomData _room;

  ChangeChildren({
    required RoomData room,
  }) : _room = room;
}

class ChangeHotelChildren extends HomeState {
  // for age
  final Child _child;

  ChangeHotelChildren({
    required Child child,
  }) : _child = child;
}

class DecreaseChildren extends HomeState {}

class ChangeRooms extends HomeState {
  final int rooms;

  ChangeRooms({required this.rooms});
}

class DecreaseRooms extends HomeState {}

class HotelSelectionChanging extends HomeState {
  final Country _country;

  HotelSelectionChanging({
    required Country country,
  }) : _country = country;
}

class HotelCitySelectionChanging extends HomeState {
  final City _city;

  HotelCitySelectionChanging({
    required City city,
  }) : _city = city;
}

class ChangeWhereToWidgetData extends HomeState {
  final String whereTo;
  final String iconTo;

  ChangeWhereToWidgetData({
    required this.whereTo,
    required this.iconTo,
  });
}

class SwitchCAirportsState extends HomeState {
  final Airport a1;
  final Airport a2;

  SwitchCAirportsState({required this.a1, required this.a2});
}

class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}

/* class HomeLoadCountries extends HomeState {
  final List<Country> countries;
  HomeLoadCountries(this.countries);
} */

class hotelRoomsState extends HomeState {
  final List<RoomData> _hotelRooms;

  hotelRoomsState({
    required List<RoomData> hotelRooms,
  }) : _hotelRooms = hotelRooms;
}

class hotelChildrenState extends HomeState {
  final List<Child> _hotelChildren;

  hotelChildrenState({
    required List<Child> hotelChildren,
  }) : _hotelChildren = hotelChildren;
}

class AirportDataImportState extends HomeState {}

class AirportDataImportedSuccessfully extends HomeState {
  final List<Airport> _popularAirports;
  final List<Airport> _airports;

  AirportDataImportedSuccessfully({
    required List<Airport> popularAirports,
    required List<Airport> airports,
  })  : _popularAirports = popularAirports,
        _airports = airports;
}

class AirportDataFailedToImport extends HomeState {
  final String _response;

  AirportDataFailedToImport({
    required String response,
  }) : _response = response;
}

class SelectingAirportState extends HomeState {
  final Airport _airportUpdate;

  SelectingAirportState({
    required Airport airportUpdate,
  }) : _airportUpdate = airportUpdate;
}

class ChangeFlightAdults extends HomeState {
  final int _adults;

  ChangeFlightAdults({required int adults}) : _adults = adults;
}

class ChangeFlightChildren extends HomeState {
  final int _children;

  ChangeFlightChildren({required int children}) : _children = children;
}

class ChangeFlightInfants extends HomeState {
  final int _infants;

  ChangeFlightInfants({required int infants}) : _infants = infants;
}

class ClassTypeSelectionState extends HomeState {
  final int _selectedClassType;

  ClassTypeSelectionState({required int selectedClassType})
      : _selectedClassType = selectedClassType;
}

class SearchingFlightState extends HomeState {
  final List<Flight> _flights;

  SearchingFlightState({required List<Flight> flights}) : _flights = flights;
}

class NoDataFoundState extends HomeState {}

class NoHotelDataFoundState extends HomeState {
  final String error;

  NoHotelDataFoundState({required this.error});
}

class GettingFlightDetailsState extends HomeState {
  final FareQuote _details;

  GettingFlightDetailsState({
    required FareQuote details,
  }) : _details = details;
}

class GettingTicketDetailsState extends HomeState {
  final Map<String, dynamic> _ticketData;

  GettingTicketDetailsState({
    required Map<String, dynamic> ticketData,
  }) : _ticketData = ticketData;
}

class ChangingFlightDirectState extends HomeState {
  final bool _isDirect;

  ChangingFlightDirectState({
    required bool isDirect,
  }) : _isDirect = isDirect;
}

class GettingBookedTicketState extends HomeState {
  final Map<String, dynamic> _bookedTicket;

  GettingBookedTicketState({
    required Map<String, dynamic> bookedTicket,
  }) : _bookedTicket = bookedTicket;
}

class GettingAlreadyBookedTicketState extends HomeState {}

class CreatingPassengersState extends HomeState {
  final List<Passenger> _passengers;

  CreatingPassengersState({
    required List<Passenger> passengers,
  }) : _passengers = passengers;
}

// Hotel New

class LoadCountriesState extends HomeState {
  final List<Country> _countries;

  LoadCountriesState({
    required List<Country> countries,
  }) : _countries = countries;
}

class LoadCitiesState extends HomeState {
  final List<City> _cities;

  LoadCitiesState({
    required List<City> cities,
  }) : _cities = cities;
}

class LoadHotelsState extends HomeState {
  final List<Hotel> _hotels;

  LoadHotelsState({
    required List<Hotel> hotels,
  }) : _hotels = hotels;
}
