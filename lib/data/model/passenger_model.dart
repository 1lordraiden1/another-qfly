class Passenger {
  String? title;
  String? firstName;
  String? lastName;
  String? mobile1;
  String? mobile1CountryCode;
  bool? isLeadPax;
  DateTime? dateOfBirth;
  int? type;
  List<IdDetail>? idDetails;
  String? passportNo;
  Nationality? nationality;
  Country? country;
  City? city;
  String? addressLine1;
  int? gender;
  String? email;
  List<dynamic>? meal;
  Fare? fare;
  dynamic ffAirline;
  dynamic ffNumber;
  List<dynamic>? paxBaggage;
  List<dynamic>? paxMeal;
  dynamic paxSeat;
  String? ticket;
  String? passengerIdType;
  String? passengerIdNo;
  DateTime? passengerIdExpiry;
  String? passengerIdIssueDate;
  String? passengerIdIssueCountryCode;

  Passenger({
    this.title,
    this.firstName,
    this.lastName,
    this.mobile1,
    this.mobile1CountryCode,
    this.isLeadPax,
    this.dateOfBirth,
    this.type,
    this.idDetails,
    this.passportNo,
    this.nationality,
    this.country,
    this.city,
    this.addressLine1,
    this.gender,
    this.email,
    this.meal,
    this.fare,
    this.ffAirline,
    this.ffNumber,
    this.paxBaggage,
    this.paxMeal,
    this.paxSeat,
    this.ticket,
    this.passengerIdType,
    this.passengerIdNo,
    this.passengerIdExpiry,
    this.passengerIdIssueDate,
    this.passengerIdIssueCountryCode,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      title: json['Title'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      mobile1: json['Mobile1'],
      mobile1CountryCode: json['Mobile1CountryCode'],
      isLeadPax: json['IsLeadPax'],
      dateOfBirth: json['DateOfBirth'] != null
          ? DateTime.parse(json['DateOfBirth'])
          : null,
      type: json['Type'],
      idDetails: json['IdDetails'] != null
          ? (json['IdDetails'] as List)
              .map((i) => IdDetail.fromJson(i))
              .toList()
          : null,
      passportNo: json['PassportNo'],
      nationality: json['Nationality'] != null
          ? Nationality.fromJson(json['Nationality'])
          : null,
      country:
          json['Country'] != null ? Country.fromJson(json['Country']) : null,
      city: json['City'] != null ? City.fromJson(json['City']) : null,
      addressLine1: json['AddressLine1'],
      gender: json['Gender'],
      email: json['Email'],
      meal: json['Meal'],
      fare: json['Fare'] != null ? Fare.fromJson(json['Fare']) : null,
      ffAirline: json['FFAirline'],
      ffNumber: json['FFNumber'],
      paxBaggage: json['PaxBaggage'],
      paxMeal: json['PaxMeal'],
      paxSeat: json['PaxSeat'],
      ticket: json['Ticket'],
      passengerIdType: json['PassengerIdType'],
      passengerIdNo: json['PassengerIdNo'],
      passengerIdExpiry: json['PassengerIdExpiry'] != null
          ? DateTime.parse(json['PassengerIdExpiry'])
          : null,
      passengerIdIssueDate: json['PassengerIdIssueDate'],
      passengerIdIssueCountryCode: json['PassengerIdIssueCountryCode'],
    );
  }

  factory Passenger.empty() {
    return Passenger(
      title: 'Mr',
      firstName: '',
      lastName: '',
      mobile1: '',
      mobile1CountryCode: '',
      isLeadPax: false,
      dateOfBirth: DateTime(1900, 1, 1),
      type: 1,
      idDetails: [],
      passportNo: '',
      nationality: Nationality(countryCode: '', countryName: ''),
      country: Country(countryCode: '', countryName: ''),
      city: City(countryCode: ''),
      addressLine1: '',
      gender: 1,
      email: '',
      meal: [],
      fare: Fare(
        totalFare: 0.0,
        fareType: '',
        agentMarkup: 0.0,
        otherCharges: 0.0,
        creditCardCharge: 0.0,
        agentPreferredCurrency: '',
        serviceFee: 0.0,
        baseFare: 0.0,
        tax: 0.0,
        penaltyAmount: 0.0,
        vatAmount: 0.0,
        vatPercentage: 0.0,
      ),
      ffAirline: null,
      ffNumber: null,
      paxBaggage: [],
      paxMeal: [],
      paxSeat: null,
      ticket: '',
      passengerIdType: '',
      passengerIdNo: '',
      passengerIdExpiry: DateTime(1900, 1, 1),
      passengerIdIssueDate: '',
      passengerIdIssueCountryCode: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'FirstName': firstName,
      'LastName': lastName,
      'Mobile1': mobile1,
      'Mobile1CountryCode': mobile1CountryCode,
      'IsLeadPax': isLeadPax,
      'DateOfBirth': dateOfBirth?.toIso8601String(),
      'Type': type,
      'IdDetails': idDetails?.map((i) => i.toJson()).toList(),
      'PassportNo': passportNo,
      'Nationality': nationality?.toJson(),
      'Country': country?.toJson(),
      'City': city?.toJson(),
      'AddressLine1': addressLine1,
      'Gender': gender,
      'Email': email,
      'Meal': meal,
      'Fare': fare?.toJson(),
      'FFAirline': ffAirline,
      'FFNumber': ffNumber,
      'PaxBaggage': paxBaggage,
      'PaxMeal': paxMeal,
      'PaxSeat': paxSeat,
      'Ticket': ticket,
      'PassengerIdType': passengerIdType,
      'PassengerIdNo': passengerIdNo,
      'PassengerIdExpiry': passengerIdExpiry?.toIso8601String(),
      'PassengerIdIssueDate': passengerIdIssueDate,
      'PassengerIdIssueCountryCode': passengerIdIssueCountryCode,
    };
  }

  bool isEmpty() {
    return title == null ||
        title!.isEmpty ||
        firstName == null ||
        firstName!.isEmpty ||
        lastName == null ||
        lastName!.isEmpty ||
        mobile1 == null ||
        mobile1!.isEmpty ||
        //mobile1CountryCode == null ||
        //isLeadPax == null ||
        dateOfBirth == null ||
        type == null ||
        //(idDetails == null || idDetails!.isEmpty) ||
        passportNo == null ||
        nationality == null ||
        //country == null ||
        //city == null ||
        addressLine1 == null ||
        gender == null ||
        email == null; // ||
    //(meal == null || meal!.isEmpty) ||
    //fare == null ||
    //ffAirline == null ||
    //ffNumber == null ||
    //(paxBaggage == null || paxBaggage!.isEmpty) ||
    //(paxMeal == null || paxMeal!.isEmpty) ||
    //paxSeat == null ||
    //ticket == null ||
    //passengerIdType == null ||
    //passengerIdNo == null ||
    //passengerIdExpiry == null ||
    //passengerIdIssueDate == null ||
    //passengerIdIssueCountryCode == null;
  }
}

class IdDetail {
  int? idType;
  String? idNumber;
  String? issuedCountryCode;
  DateTime? issueDate;
  DateTime? expiryDate;

  IdDetail({
    this.idType,
    this.idNumber,
    this.issuedCountryCode,
    this.issueDate,
    this.expiryDate,
  });

  factory IdDetail.fromJson(Map<String, dynamic> json) {
    return IdDetail(
      idType: json['IdType'],
      idNumber: json['IdNumber'],
      issuedCountryCode: json['IssuedCountryCode'],
      issueDate:
          json['IssueDate'] != null ? DateTime.parse(json['IssueDate']) : null,
      expiryDate: json['ExpiryDate'] != null
          ? DateTime.parse(json['ExpiryDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdType': idType,
      'IdNumber': idNumber,
      'IssuedCountryCode': issuedCountryCode,
      'IssueDate': issueDate?.toIso8601String(),
      'ExpiryDate': expiryDate?.toIso8601String(),
    };
  }
}

class Nationality {
  String? countryCode;
  String? countryName;

  Nationality({
    this.countryCode,
    this.countryName,
  });

  factory Nationality.fromJson(Map<String, dynamic> json) {
    return Nationality(
      countryCode: json['CountryCode'],
      countryName: json['CountryName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CountryCode': countryCode,
      'CountryName': countryName,
    };
  }
}

class Country {
  String? countryCode;
  String? countryName;

  Country({
    this.countryCode,
    this.countryName,
  });

  factory Country.empty() {
    return Country(
      countryCode: '',
      countryName: '',
    );
  }

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryCode: json['CountryCode'],
      countryName: json['CountryName'],
    );
  }

  factory Country.fromHotelJson(Map<String, dynamic> json) {
    return Country(
      countryCode: json['Code'],
      countryName: json['Name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CountryCode': countryCode,
      'CountryName': countryName,
    };
  }

  Map<String, dynamic> toHotelJson() {
    return {
      'Code': countryCode,
      'Name': countryName,
    };
  }
}

class City {
  String? countryCode;
  String? countryName;

  City({
    this.countryCode,
    this.countryName,
  });

  factory City.empty() {
    return City(
      countryCode: '',
      countryName: '',
    );
  }

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      countryCode: json['CountryCode'],
      countryName: json['CountryName'],
    );
  }
  factory City.fromHotelJson(Map<String, dynamic> json) {
    return City(
      countryCode: json['Code'],
      countryName: json['Name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CountryCode': countryCode,
      'CountryName': countryName,
    };
  }

  Map<String, dynamic> toHotelJson() {
    return {
      'Code': countryCode,
      'Name': countryName,
    };
  }
}

class Fare {
  double? totalFare;
  String? fareType;
  double? agentMarkup;
  double? otherCharges;
  double? creditCardCharge;
  String? agentPreferredCurrency;
  double? serviceFee;
  double? baseFare;
  double? tax;
  double? penaltyAmount;
  double? vatAmount;
  double? vatPercentage;

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

  factory Fare.fromJson(Map<String, dynamic> json) {
    return Fare(
      totalFare: json['TotalFare'],
      fareType: json['FareType'],
      agentMarkup: json['AgentMarkup'],
      otherCharges: json['OtherCharges'],
      creditCardCharge: json['CreditCardCharge'],
      agentPreferredCurrency: json['AgentPreferredCurrency'],
      serviceFee: json['ServiceFee'],
      baseFare: json['BaseFare'],
      tax: json['Tax'],
      penaltyAmount: json['PenaltyAmount'],
      vatAmount: json['VATAmount'],
      vatPercentage: json['VATPercentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'TotalFare': totalFare,
      'FareType': fareType,
      'AgentMarkup': agentMarkup,
      'OtherCharges': otherCharges,
      'CreditCardCharge': creditCardCharge,
      'AgentPreferredCurrency': agentPreferredCurrency,
      'ServiceFee': serviceFee,
      'BaseFare': baseFare,
      'Tax': tax,
      'PenaltyAmount': penaltyAmount,
      'VATAmount': vatAmount,
      'VATPercentage': vatPercentage,
    };
  }
}
