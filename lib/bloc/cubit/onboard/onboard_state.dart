part of 'onboard_cubit.dart';

@immutable
abstract class OnBoardState {}

class OnBoardInitial extends OnBoardState {
}

class OnBoardLoading extends OnBoardState {

  final bool roadmapIsLoading;
  OnBoardLoading(this.roadmapIsLoading);
}
class OnBoardPageChanged extends OnBoardState {

  final int index;
  OnBoardPageChanged(this.index);
}
class RoadmapLoaded extends OnBoardState {
 // List<RoadMapData>roadmapData;

  RoadmapLoaded();
}
class RoadmapError extends OnBoardState {

  final String error;
  RoadmapError(this.error);
}