class Category {
  final String numeric;
  final String? textual;

  Category({required this.numeric, this.textual});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      numeric: json['numeric'] as String,
      textual: json['textual'] as String?,
    );
  }
}
