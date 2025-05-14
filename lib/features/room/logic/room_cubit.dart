import 'package:controlpanel/data/model/classes.dart';
import 'package:controlpanel/features/room/data/api_add_room.dart';
import 'package:controlpanel/features/room/data/api_get_rooms.dart';
import 'package:controlpanel/features/room/logic/classes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomCubit extends Cubit<RoomState> {
  final ApiAddRoom _addRoom;
  final ApiGetRooms _getRooms;

  RoomCubit(this._addRoom, this._getRooms) : super(RoomStateInitial());

  Future<void> fetchRoomsCubit() async {
    emit(RoomStateLoading());
    final result = await _getRooms.getRoom();
    result.fold(
      (failure) {
        return emit(RoomStateFailure(message: failure.message));
      },
      (room) {
        return emit(RoomStateSuccess(room: room));
      },
    );
  }

  Future<void> addRoomCubit() async {
    emit(RoomAddStateLoading());
    final result = await _addRoom.addRoom(
      Room(id: 1, name: name.text.trim(), students: []),
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
