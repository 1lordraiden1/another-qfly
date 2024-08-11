class PriceBreakdown {
  final String currency;
  final String PTC;
  final int count;
  final double basePrice;
  final double tax;
  final double margin;
  final double total;
  final List<Map<String, dynamic>> taxBreakDown;

  PriceBreakdown({
    required this.currency,
    required this.PTC,
    required this.count,
    required this.basePrice,
    required this.tax,
    required this.margin,
    required this.total,
    required this.taxBreakDown,
  });

  factory PriceBreakdown.fromJson(Map<String, dynamic> json) {
    return PriceBreakdown(
      currency: json['currency'] as String,
      PTC: json['PTC'] as String,
      count: json['count'] as int,
      basePrice: json['basePrice'] as double,
      tax: json['tax'] as double,
      margin: json['margin'] as double,
      total: json['total'] as double,
      taxBreakDown: (json['taxBreakDown'] as List<dynamic>)
          .cast<Map<String, dynamic>>(),
    );
  }
}
