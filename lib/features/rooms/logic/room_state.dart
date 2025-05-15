import 'package:controlpanel/features/rooms/data/model/room.dart';

sealed class RoomState {}

final class RoomStateInitial extends RoomState {}

final class RoomStateLoading extends RoomState {}

final class RoomStateFailure extends RoomState {
  final String message;
  RoomStateFailure({required this.message});
}

final class RoomStateSuccess extends RoomState {
  final List<Room> rooms;
  RoomStateSuccess({required this.rooms});
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
