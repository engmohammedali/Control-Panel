import 'package:controlpanel/features/rooms/data/api_add_room.dart';
import 'package:controlpanel/features/rooms/data/api_get_rooms.dart';
import 'package:controlpanel/features/rooms/data/model/room.dart';
import 'package:controlpanel/features/rooms/logic/room_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomCubit extends Cubit<RoomState> {
  final ApiAddRoom _addRoom;
  final ApiGetRooms _getRooms;

  RoomCubit(this._addRoom, this._getRooms) : super(RoomStateInitial());

  Future<void> fetchRoomsCubit({
    required int centerId,
    required int instituteId,
  }) async {
    emit(RoomStateLoading());
    final result = await _getRooms.getRooms(
      centerId: centerId,
      instituteId: instituteId,
    );
    result.fold(
      (failure) {
        return emit(RoomStateFailure(message: failure.message));
      },
      (rooms) {
        return emit(RoomStateSuccess(rooms: rooms));
      },
    );
  }

  Future<void> addRoomCubit({
    required int instituteId,
    required int centerId,
  }) async {
    emit(RoomAddStateLoading());
    final result = await _addRoom.addRoom(
      instituteId: instituteId,
      centerId: centerId,
      room: Room(id: Room.nextId, name: name.text.trim(), students: []),
    );
    result.fold(
      (failure) {
        return emit(RoomStateFailure(message: failure.message));
      },
      (message) {
        clear();

        return emit(RoomAddStateSuccess(message: message));
      },
    );
  }

  final TextEditingController name = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void clear() {
    name.clear();
  }
}
