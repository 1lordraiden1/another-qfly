import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';
import 'package:qfly/data/Shared/sharedPreferences.dart';
import 'package:qfly/data/model/airport_model.dart';
import 'package:qfly/data/model/global/country_model.dart';
import 'package:qfly/data/network/constant/end_points.dart';
import 'package:qfly/data/services/api_services.dart';
import 'package:qfly/data/services/auth_services.dart';

class HomeServices {
  //final apiService = ApiService();

  // Hotel

  Future<List<Map<String, dynamic>>> fetchCountriesData() async {
    final url = Uri.parse(
      EndPoints.baseUrl + EndPoints.getCountries,
    ); // Replace with your API endpoint
    print(url);
    try {
      //final String guest = await AuthService().getOurAuth();
      final response = await http.get(url, headers: {
        'guest': await SharedPreferencesUtil.getAuthToken('authToken') ??
            await AuthService().authMe(), //guest,
      });

      print(response.statusCode.toString());
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        final airports = decodedData['data'] as List<dynamic>;

        return airports.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load Countries data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Map<String, dynamic>>> fetchCitiesData(String value) async {
    final url = Uri.parse(
      EndPoints.baseUrl + EndPoints.getCities + value,
    ); // Replace with your API endpoint
    print(url);
    try {
      //final String guest = await AuthService().getOurAuth();

      final response = await http.get(
        url,
        headers: {
          'guest': await SharedPreferencesUtil.getAuthToken('authToken') ??
              await AuthService().authMe(), //guest,
        },
      );

      print(response.statusCode.toString());
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        final data = decodedData['data'] as List<dynamic>;

        return data.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load Cities data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Map<String, dynamic>>> searchHotelsData(
    String cityCode,
    DateTime checkIn,
    DateTime checkOut,
    List<int> adults,
    List<int> children,
    List<int> childrenAges,
    bool refundable,
    String mealType,
    String guestNationality,
  ) async {
    final url = Uri.https(
      EndPoints.baseUrl1,
      EndPoints.basePart + EndPoints.searchHotel,
      {
        'city': '100639',
        'check_in': '2024-08-27',
        'check_out': '2024-08-28',
        'adults': '2',
        'children': '2',
        'children_ages': '[4,5]',
        'refundable': 'true',
        'nom_room': '0',
        'meal_type': 'all',
        'page': '1',
        'per_page': '5',
        'guestNationality': 'EG'
      },
    );

   

    final test = Uri.https(
      EndPoints.baseUrl1,
      EndPoints.basePart + EndPoints.searchHotel,
      {
        'city': "$cityCode",
        'check_in': checkIn.toString().substring(0, 10),
        'check_out': checkOut.toString().substring(0, 10),
        'adults': adults.length == 1 ? "${adults[0]}" : "${adults.join(",")}",
        'children':
            children.length == 1 ? "${children[0]}" : "${children.join(",")}",
        'children_ages': "$childrenAges",
        'refundable': 'true',
        'nom_room': '0',
        'meal_type': 'all',
        'page': '1',
        'per_page': '5',
        'guestNationality': 'EG'
      },
    );
    // Replace with your API endpoint
// city=100639&check_in=2024-08-27&check_out=2024-08-28&adults=2&children=2&children_ages=[4,5]
// &refundable=true&nom_room=0&meal_type=all&page=1&per_page=2&guestNationality=EG
    print(url);
    print(test);
    try {
      //final String guest = await AuthService().getOurAuth();

      final response = await http.get(
        url,
        headers: {
          'guest': await SharedPreferencesUtil.getAuthToken('authToken') ??
              await AuthService().authMe(), //guest,
        },
      );

      print(response.statusCode.toString());
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        final data = decodedData['data']['data'] as List<dynamic>;

        return data.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load Cities data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

// Flight
/*   Future<List<Airport>> getAirports(String searchValue) async {
    final auth = AuthService();
    final token = await auth.getOurAuth();
    print(token.toString());
    final response = await apiService.getHttpRequest(
        EndPoints.getAirports, token, searchValue); // base url

    print(response!.body);
    final data = json.decode(response.body);

    final airport = data['data']['data'];
    final list = (airport as List)
        .map((linkJson) => Airport.fromJson(linkJson))
        .toList();
    return list;
  } */

  Future<List<Map<String, dynamic>>> fetchAirportsData(
      String searchValue) async {
    final url = Uri.parse(
      EndPoints.baseUrl + EndPoints.getAirports + searchValue,
    ); // Replace with your API endpoint

    try {
      //final String guest = await AuthService().getOurAuth();
      final response = await http.get(url, headers: {
        'guest': await SharedPreferencesUtil.getAuthToken('authToken') ??
            await AuthService().authMe(), //guest,
      });

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        final airports = decodedData['data']['data'] as List<dynamic>;

        return airports.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load airports data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  /* Future<List<Map<String, dynamic>>> */ searchForFlights(
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
    final url = Uri.parse(EndPoints.baseUrl + EndPoints.searchAirports);
    print(url);

    final response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
        'guest': await AuthService().authMe(),
        // '668d267179d48172052644939DmOaTPQXSs9xksWSMcwisOU1MoKayU170VLpbv' ,
      },
      body: json.encode(
        {
          "IPAddress":
              "122.176.187.75", // مطلوب - عنوان IP الخاص بالمستخدم الذي يقوم بالحجز.
          "EndUserBrowserAgent":
              "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36", // مطلوب - معلومات عن المتصفح الذي يستخدمه المستخدم.
          "PointOfSale": pointOfSale.toUpperCase() ??
              "CAI", // مطلوب - مكان أو محافظة الشخص الذي يقوم بالحجز.
          "RequestOrigin": origin.isEmpty
              ? "CAI"
              : origin, // "Egypt", // مطلوب - بلد منشأ الطلب.
          "UserData":
              null, // اختياري - بيانات إضافية للمستخدم يمكن أن تشمل معرفات أو ملاحظات.
          "JourneyType": 1, // مطلوب - نوع الرحلة (1: ذهاب فقط، 2: ذهاب وعودة).
          "AdultCount": adultCount, // مطلوب - عدد البالغين.
          "ChildCount": childCount, // مطلوب - عدد الأطفال.
          "InfantCount": infantCount, // مطلوب - عدد الرضع.
          "FlightCabinClass":
              classType, // مطلوب - فئة المقصورة (1: اقتصادية، 2: رجال أعمال، 3: أولى).
          "DirectFlight":
              isDirect, // مطلوب - هل يفضل الرحلات المباشرة فقط (true) أو لا (false).
          "Segment": [
            {
              "Origin": pointOfSale.isEmpty
                  ? "CAI"
                  : pointOfSale.toUpperCase(), // مطلوب - مطار المغادرة.
              "Destination": destination.isEmpty
                  ? "RUH"
                  : destination.toUpperCase(), // مطلوب - مطار الوصول.
              "PreferredDepartureTime":
                  '${departureTime.toString().substring(0, 10)}T00:00:00',
              // "2024-07-11T00:00:00", // مطلوب - وقت المغادرة المفضل.
              "PreferredArrivalTime":
                  "2024-07-13T00:00:00", // مطلوب - وقت الوصول المفضل.
              //"PreferredAirlines": ["QR"] // اختياري - شركات الطيران المفضلة.
            }
          ],
          "page": 1, "per_page": 50,
        },
      ),
    );

    print(response.statusCode.toString());
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 403) {
      final decodeError = json.decode(response.body);
    }

/*     if (response.statusCode == 201) {
      final decodeError = json.decode(response.body);
      return [
        {
          'errors': decodeError['errors'],
        }
      ];
    }
 */
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      if (decodedData['data'] == null) {
        final error = decodedData['errors'];
        return [
          {'errors': error}
        ];
      }

      final flights = decodedData['data']['data'] as List<dynamic>;

      print(flights);

      return flights.cast<Map<String, dynamic>>();
    } else {
      final decodeError = json.decode(response.body);
      throw Exception(decodeError['errors']);
    }
  }

  searchForFlightDetails(
    String pointOfSale,
    String origin,
    String resultId,
    bool isLcc,
    String companyName,
  ) async {
    final url = Uri.parse(EndPoints.baseUrl + EndPoints.searchDetails);
    print(url);

    final response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
        'guest': await SharedPreferencesUtil.getAuthToken('authToken') ??
            await AuthService().authMe(),
        // '668d267179d48172052644939DmOaTPQXSs9xksWSMcwisOU1MoKayU170VLpbv' ,
      },
      body: json.encode(
        {
          "ResultId": resultId,
          "EndUserBrowserAgent":
              "Mozilla/5.0(Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36",
          "PointOfSale": pointOfSale.toUpperCase(),
          "RequestOrigin": origin,
          "UserData": null,
          "ipaddress": "122.176.187.75",
          "company_name": companyName,
          "isLcc": isLcc,
        },
      ),
    );

    print(response.statusCode.toString());
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 403) {
      final decodeError = json.decode(response.body);
      throw Exception(decodeError['error']);
    }

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      if (decodedData['data'] == null) {
        final error = decodedData['errors'];
        return [
          {'errors': error}
        ];
      }

      final details = decodedData['data'];

      print(details);

      return details;
    } else {
      final decodeError = json.decode(response.body);
      throw Exception(decodeError['error']);
    }
  }

  gettingTicketWhenLCCisTrue(
    Map<String, dynamic> fare,
    Map<String, dynamic> fareRules,
    List<dynamic> segment,
    String pointOfSale,
    String origin,
    String resultId,
    String companyName,
    bool isLcc,
    String originAirportCode,
    String desAirportCode,
    String airlineCode,
    String responseTime,
  ) async {
    final url = Uri.parse(EndPoints.baseUrl + EndPoints.getTicketLCCTrue);
    print(url);

    final response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
        'guest': await SharedPreferencesUtil.getAuthToken('authToken') ??
            await AuthService().authMe(),
        // '668d267179d48172052644939DmOaTPQXSs9xksWSMcwisOU1MoKayU170VLpbv' ,
      },
      body: json.encode({
        "ResultId": resultId,
        "company_name": companyName,
        "IPAddress": "122.176.187.75",
        "EndUserBrowserAgent":
            "Mozilla/5.0(Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36",
        "Itinerary": {
          "Segments": segment,
          "Passenger": [
            {
              "Title": "Mr",
              "FirstName": "Mohamada",
              "LastName": "Sayeda",
              "Mobile1": "0115467855",
              "Mobile1CountryCode": "20",
              "IsLeadPax": true,
              "DateOfBirth": "1986-02-17T00:00:00",
              "Type": 1,
              "IdDetails": [
                {
                  "IdType": 1,
                  "IdNumber": "PassportNo1",
                  "IssuedCountryCode": "",
                  "IssueDate": "0001-01-01T00:00:00",
                  "ExpiryDate": "2024-09-19T00:00:00"
                }
              ],
              "PassportNo": "",
              "Nationality": {"CountryCode": "BZ", "CountryName": "BZ"},
              "Country": {"CountryCode": "BZ", "CountryName": "BZ"},
              "City": {"CountryCode": "BZ"},
              "AddressLine1": "",
              "Gender": 1,
              "Email": "MohamedSayeda.backend@GMAIL.COM",
              "Meal": [],
              "Fare": fare,
            }
          ],
          "FareRules": [fareRules],
          "Destination": desAirportCode.toString().toUpperCase(),
          "Origin": originAirportCode.toUpperCase(),
          "ValidatingAirlineCode": airlineCode.toString(),
          "NonRefundable": false,
          "IsLcc": true,
          "AirlineRemark":
              " This is a Flexi Fare. Includes free seat(as per restriction). Lower cancellation. Please refer fare rules.. . 6E main.",
          "TripIndicator": 1,
          "ResponseTime": responseTime,
          "JourneyType": 1
        },
        "PNR": "",
        "PointOfSale": pointOfSale.toUpperCase(),
        "RequestOrigin": origin.toUpperCase(),
        "UserData": ""
      }),
    );

    print(response.statusCode.toString());
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 403) {
      String strResponse = response.body;
      final decodeError = json.decode(strResponse /* response.body */);
      throw Exception(decodeError['error']);
    }

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      if (decodedData['data'] == null) {
        final error = decodedData['errors'];
        return [
          {'errors': error}
        ];
      }

      final details = decodedData['data'];

      print(details);

      return details;
    } else {
      final decodeError = json.decode(response.body);
      throw Exception(decodeError['error']);
    }
  }

  gettingBookingWhenLCCisFalse(
    Map<String, dynamic> fare,
    Map<String, dynamic> fareRules,
    List<dynamic> segment,
    String pointOfSale,
    String origin,
    String resultId,
    String companyName,
    bool isLcc,
    String originAirportCode,
    String desAirportCode,
    String airlineCode,
    String responseTime,
    String userSearchTime,
    String lastTicketDate,
    String ticketAdvisory,
    /*   double adultTotalFare,
    double adultBaseFare,
    double adultTax,
    double adultServiceFee,
    double childTotalFare,
    double childBaseFare,
    double childTax,
    double childServiceFee,
    double infantTotalFare,
    double infantBaseFare,
    double infantTax,
    double infantServiceFee, */
  ) async {
    final url = Uri.parse(EndPoints.baseUrl + EndPoints.bookingLCCFalse);
    print(url);

    final response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
        'guest': await SharedPreferencesUtil.getAuthToken('authToken') ??
            await AuthService().authMe(),
        // '668d267179d48172052644939DmOaTPQXSs9xksWSMcwisOU1MoKayU170VLpbv' ,
      },
      body: json.encode(
        {
          "ResultId": resultId,
          "company_name": companyName,
          "IPAddress": "122.176.187.75",
          "EndUserBrowserAgent":
              "Mozilla/5.0(Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36",
          "Itinerary": {
            "Segments": segment,
            "Passenger": [
              {
                "Title": "Mr",
                "FirstName": "Mohameda",
                "LastName": "Sayeda",
                "Mobile1": "0115467855",
                "Mobile1CountryCode": "20",
                "IsLeadPax": true,
                "DateOfBirth": "1986-02-17T00:00:00",
                "Type": 1,
                "IdDetails": [
                  {
                    "IdType": 1,
                    "IdNumber": "PassportNo1",
                    "IssuedCountryCode": "",
                    "IssueDate": "0001-01-01T00:00:00",
                    "ExpiryDate": "2024-09-19T00:00:00"
                  }
                ],
                "PassportNo": "",
                "Nationality": {"CountryCode": "BZ", "CountryName": "BZ"},
                "Country": {"CountryCode": "BZ", "CountryName": "BZ"},
                "City": {"CountryCode": "BZ"},
                "AddressLine1": "",
                "Gender": 1,
                "Email": "MohamedSayeda.backend@GMAIL.COM",
                "Meal": [],
                "Fare": {
                  "TotalFare":
                      74.7709025674000002936736564151942729949951171875,
                  "FareType": "RP",
                  "AgentMarkup": 0,
                  "OtherCharges": 0,
                  "CreditCardCharge": 0,
                  "AgentPreferredCurrency": "USD",
                  "ServiceFee": 2,
                  "BaseFare":
                      47.08539799799999769902569823898375034332275390625,
                  "Tax": 25.685504569399999041934279375709593296051025390625,
                  "PenaltyAmount": 0,
                  "VATAmount": 0,
                  "VATPercentage": 0
                },
                "FFAirline": null,
                "FFNumber": null,
                "PaxBaggage": [],
                "PaxMeal": [],
                "PaxSeat": null,
                "Ticket": lastTicketDate, // "08JUL24", // مهم تغيرها
                "PassengerIdType": "Passport",
                "PassengerIdNo": "152456879147222",
                "PassengerIdExpiry": "2030-09-19T00:00:00",
                "PassengerIdIssueDate": "",
                "PassengerIdIssueCountryCode": ""
              }
            ],
            "FareRules": [fareRules],
            "Destination": desAirportCode.toString().toUpperCase(),
            "Origin": originAirportCode.toUpperCase(),
            "ValidatingAirlineCode": airlineCode.toString(),
            "NonRefundable": false,
            "IsLcc": false,
            "AirlineRemark":
                " This is a Flexi Fare. Includes free seat(as per restriction). Lower cancellation. Please refer fare rules.. . 6E main.",
            "TripIndicator": 1,
            "ResponseTime": responseTime,
            "JourneyType": 1,
            "SearchType": "1", //
            "StaffRemarks": "",
            "TravelDate": userSearchTime, //"2024-09-15", // user search time
            "CreatedOn":
                DateTime.now().toString().substring(0, 10), //"2024-07-09", //
            "AgentRefNo": null,
            "IsDomestic": false,
            "PointOfSale": pointOfSale.toUpperCase(),
            "RequestOrigin": origin.toUpperCase(),
            "EarnedLoyaltyPoints": "",
            "Airline": airlineCode,
            "ProviderRemarks": null,
            "LastTicketDate": lastTicketDate, //"09JUL24", //ok
            "TicketAdvisory": ticketAdvisory, //ok
            //"TICKETS ARE NON-REFUNDABLE \nLAST TKT DTE 09JUL24  - SEE ADV PURCHASE",
            "ValidatingAirline": airlineCode,
          },
        },
      ),
    );

    print(response.statusCode.toString());
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 403) {
      String strResponse = response.body;
      final decodeError = json.decode(strResponse /* response.body */);
      throw Exception(decodeError['errors']);
    }

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      if (decodedData['data'] == null) {
        final error = decodedData['errors'];
        return [
          {'errors': error}
        ];
      }

      final details = decodedData['data'];

      print(details);

      return details;
    } else {
      final decodeError = json.decode(response.body);
      throw Exception(decodeError['error']);
    }
  }

  gettingTicketWhenLCCisFalse(
    Map<String, dynamic> fare,
    Map<String, dynamic> fareRules,
    List<dynamic> segment,
    String pointOfSale,
    String origin,
    String resultId,
    String companyName,
    bool isLcc,
    String originAirportCode,
    String desAirportCode,
    String airlineCode,
    String responseTime,
    String userSearchTime,
    String lastTicketDate,
    String ticketAdvisory,
    String createdOn,
    String pnr,
  ) async {
    final url = Uri.parse(EndPoints.baseUrl + EndPoints.ticketLCCFalse);
    print(url);

    final response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
        'guest': await SharedPreferencesUtil.getAuthToken('authToken') ??
            await AuthService().authMe(),
        // '668d267179d48172052644939DmOaTPQXSs9xksWSMcwisOU1MoKayU170VLpbv' ,
      },
      body: json.encode(
        {
          "company_name": companyName,
          "IPAddress": "122.176.187.75",
          "EndUserBrowserAgent":
              "Mozilla/5.0(Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36",
          "Itinerary": {
            "Segments": segment,
            "Passenger": [
              {
                "Title": "Mr",
                "FirstName": "Mohameda",
                "LastName": "Sayeda",
                "Mobile1": "0115467855",
                "Mobile1CountryCode": "20",
                "IsLeadPax": true,
                "DateOfBirth": "1986-02-17T00:00:00",
                "Type": 1,
                "IdDetails": [
                  {
                    "IdType": 1,
                    "IdNumber": "PassportNo1",
                    "IssuedCountryCode": "",
                    "IssueDate": "0001-01-01T00:00:00",
                    "ExpiryDate": "2024-09-19T00:00:00"
                  }
                ],
                "PassportNo": "",
                "Nationality": {"CountryCode": "BZ", "CountryName": "BZ"},
                "Country": {"CountryCode": "BZ", "CountryName": "BZ"},
                "City": {"CountryCode": "BZ"},
                "AddressLine1": "",
                "Gender": 1,
                "Email": "MohamedSayeda.backend@GMAIL.COM",
                "Meal": [],
                "Fare": fare,
                "FFAirline": null,
                "FFNumber": null,
                "PaxBaggage": [],
                "PaxMeal": [],
                "PaxSeat": null,
                "Ticket": lastTicketDate, // "08JUL24", // مهم تغيرها
                "PassengerIdType": "Passport",
                "PassengerIdNo": "152456879147222",
                "PassengerIdExpiry": "2030-09-19T00:00:00",
                "PassengerIdIssueDate": "",
                "PassengerIdIssueCountryCode": ""
              }
            ],
            "FareRules": [fareRules],
            "Destination": desAirportCode.toString().toUpperCase(),
            "Origin": originAirportCode.toUpperCase(),
            "ValidatingAirlineCode": airlineCode.toString(),
            "NonRefundable": false,
            "IsLcc": false,
            "AirlineRemark":
                " This is a Flexi Fare. Includes free seat(as per restriction). Lower cancellation. Please refer fare rules.. . 6E main.",
            "TripIndicator": 1,
            "ResponseTime": responseTime,
            "JourneyType": 1,
            "SearchType": "1", //
            "StaffRemarks": "",
            "TravelDate": userSearchTime, //"2024-09-15", // user search time
            "CreatedOn": createdOn, //"2024-07-09", //
            "AgentRefNo": null,
            "IsDomestic": false,
            "PointOfSale": pointOfSale.toUpperCase(),
            "RequestOrigin": origin.toUpperCase(),
            "EarnedLoyaltyPoints": "",
            "Airline": airlineCode,
            "ProviderRemarks": null,
            "LastTicketDate": lastTicketDate, //"09JUL24", //ok
            "TicketAdvisory": ticketAdvisory, //ok
            //"TICKETS ARE NON-REFUNDABLE \nLAST TKT DTE 09JUL24  - SEE ADV PURCHASE",
            "ValidatingAirline": airlineCode,
          },
          "PNR": pnr,
          "ConfirmPriceChangeTicket": false
        },
      ),
    );

    print(response.statusCode.toString());
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 403) {
      String strResponse = response.body;
      final decodeError = json.decode(strResponse /* response.body */);
      throw Exception(decodeError['errors']);
    }

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      if (decodedData['data'] == null) {
        final error = decodedData['errors'];
        return [
          {'errors': error}
        ];
      }

      final details = decodedData['data'];

      print(details);

      return details;
    } else {
      final decodeError = json.decode(response.body);
      throw Exception(decodeError['error']);
    }
  }
}
