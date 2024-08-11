class CxlPolicy {
  final String deadline;
  final bool nonRefundable;
  final String? info;
  final List<String> conditions;

  CxlPolicy({
    required this.deadline,
    required this.nonRefundable,
    this.info,
    required this.conditions,
  });

  factory CxlPolicy.fromJson(Map<String, dynamic> json) {
    return CxlPolicy(
      deadline: json['deadline'] as String,
      nonRefundable: json['nonRefundable'] as bool,
      info: json['info'] as String?,
      conditions: (json['conditions'] as List<dynamic>).cast<String>(),
    );
  }
}
