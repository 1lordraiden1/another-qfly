part of 'home_cubit.dart';

sealed class HomeEvent {}

class ChangeWhereFromEvent extends HomeEvent {
  final String wf;
  final String iconf;
  ChangeWhereFromEvent({required this.wf, required this.iconf});
}

class ChangeWhereToEvent extends HomeEvent {
  final String wt;
  final String icont;
  ChangeWhereToEvent({required this.wt, required this.icont});
}
