import 'package:controlpanel/data/model/classes.dart';

sealed class RoomState {}

final class RoomStateInitial extends RoomState {}

final class RoomStateLoading extends RoomState {}

final class RoomStateFailure extends RoomState {
  final String message;
  RoomStateFailure({required this.message});
}

final class RoomStateSuccess extends RoomState {
  final Room room;
  RoomStateSuccess({required this.room});
}

final class RoomAddStateLoading extends RoomState {}

final class RoomAddStateSuccess extends RoomState {
  final String message;
  RoomAddStateSuccess({required this.message});
}

final class RoomAddStateFailure extends RoomState {
  final String message;
  RoomAddStateFailure({required this.message});
}
