part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class RoadmapInitial extends AuthState {
}

class RoadmapLoading extends AuthState {

  final bool roadmapIsLoading;
  RoadmapLoading(this.roadmapIsLoading);
}
class RoadmapIndexChanged extends AuthState {

  final bool roadmapIsLoading;
  RoadmapIndexChanged(this.roadmapIsLoading);
}
class RoadmapLoaded extends AuthState {
 // List<RoadMapData>roadmapData;

  RoadmapLoaded();
}
class RoadmapError extends AuthState {

  final String error;
  RoadmapError(this.error);
}