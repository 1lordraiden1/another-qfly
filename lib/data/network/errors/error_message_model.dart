import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final String error;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.error,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        statusCode: json['status'],
        statusMessage: json['message'],
        error: json['error'],
      );

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        error,
      ];
}
