import 'package:qfly/data/model/global/price_breakdown_model.dart';

class Price {
  final String currency;
  final double basePrice;
  final double tax;
  final double margin;
  final double fees;
  final double total;
  final List<PriceBreakdown> priceBreakDowns;

  Price({
    required this.currency,
    required this.basePrice,
    required this.tax,
    required this.margin,
    required this.fees,
    required this.total,
    required this.priceBreakDowns,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      currency: json['currency'] as String,
      basePrice: json['basePrice'] as double,
      tax: json['tax'] as double,
      margin: json['margin'] as double,
      fees: json['fees'] as double,
      total: json['total'] as double,
      priceBreakDowns: (json['priceBreakDowns'] as List<dynamic>)
          .map((link) => PriceBreakdown.fromJson(link))
          .toList(),
    );
  }
}
