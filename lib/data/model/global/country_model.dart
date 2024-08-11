class Country {
  final String code;
  final String name;

  final String icon;

  Country({
    required this.code,
    required this.name,
    required this.icon,
  });

  factory Country.empty() {
    return Country(code: '', name: '', icon: '');
  }

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code: json['code'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
    );
  }
}
