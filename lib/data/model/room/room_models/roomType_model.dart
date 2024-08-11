class RoomType {
  final String code;
  final String name;

  RoomType({required this.code, required this.name});

  factory RoomType.fromJson(Map<String, dynamic> json) {
    return RoomType(
      code: json['code'] as String,
      name: json['name'] as String,
    );
  }
}
