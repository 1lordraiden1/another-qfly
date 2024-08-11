import 'dart:convert';

class Airport {
  final int id;
  final String name;
  final String code;
  final String country;
  final String codeCity;

  Airport({
    required this.id,
    required this.name,
    required this.code,
    required this.country,
    required this.codeCity,
  });

  Airport copyWith({
    int? id,
    String? name,
    String? code,
    String? country,
    String? codeCity,
  }) =>
      Airport(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        country: country ?? this.country,
        codeCity: codeCity ?? this.codeCity,
      );

  factory Airport.empty() => Airport(
        id: 0,
        name: '',
        code: '',
        country: '',
        codeCity: '',
      );

  factory Airport.fromRawJson(String str) => Airport.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Airport.fromJson(Map<String, dynamic> json) => Airport(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        country: json["country"],
        codeCity: json["code_city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "country": country,
        "code_city": codeCity,
      };
}
