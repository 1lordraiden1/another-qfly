part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}
const int index=0;

class PageIsChanged extends MainState {
  final int index;
  PageIsChanged(this.index);
}




class MainError extends MainState {
  final String error;
  MainError(this.error);
}