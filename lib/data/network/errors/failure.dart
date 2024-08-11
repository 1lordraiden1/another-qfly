import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  // @override
  // List<Object?> get props => [];
}
class AuthFailure extends Failure {
  const AuthFailure(super.message);

// @override
// List<Object?> get props => [];
}

class OffLineFailure extends Failure {
  const OffLineFailure(super.message);
  // @override
  // List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure(super.message);
  // @override
  // List<Object?> get props => [];
}
