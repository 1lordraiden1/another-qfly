class View {
  final int code;
  final String name;

  View({required this.code, required this.name});

  factory View.fromJson(Map<String, dynamic> json) {
    return View(
      code: json['code'] as int,
      name: json['name'] as String,
    );
  }
}
