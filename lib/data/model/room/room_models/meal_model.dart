class Meal {
  final String code;
  final String name;

  Meal({required this.code, required this.name});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      code: json['code'] as String,
      name: json['name'] as String,
    );
  }
}
