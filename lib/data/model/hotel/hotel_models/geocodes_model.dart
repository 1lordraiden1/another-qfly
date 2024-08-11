class GeoCodes {
  final String latitude;
  final String longitude;

  GeoCodes({required this.latitude, required this.longitude});

  factory GeoCodes.fromJson(Map<String, dynamic> json) {
    return GeoCodes(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );
  }
}
