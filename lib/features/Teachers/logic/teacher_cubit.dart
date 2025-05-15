import 'package:controlpanel/features/Teachers/data/api_add_teacher.dart';
import 'package:controlpanel/features/Teachers/data/api_get_teacher.dart';
import 'package:controlpanel/features/Teachers/data/model/teacher.dart';
import 'package:controlpanel/features/Teachers/logic/teacher_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherCubit extends Cubit<TeacherState> {
  final ApiAddTeacher _addTeacher;
  final ApiGetTeacher _getTeacher;

  TeacherCubit(this._addTeacher, this._getTeacher)
    : super(TeacherStateInitial());

  Future<void> fetchTeachersCubit({
    required int instituteId,
    required int centerId,
    required int roomId,
  }) async {
    emit(TeacherStateLoading());
    final result = await _getTeacher.getTeacher(
      instituteId: instituteId,
      centerId: centerId,
      roomId: roomId,
    );
    result.fold(
      (failure) {
        return emit(TeacherStateFailure(message: failure.message));
      },
      (teacher) {
        return emit(TeacherStateSuccess(teacher: teacher));
      },
    );
  }

  Future<void> addTeacherCubit({
    required int roomId,
    required int centerId,
    required int instituteId,
  }) async {
    emit(TeacherAddStateLoading());
    final result = await _addTeacher.addTeacher(
      teacher: Teacher(
        id: Teacher.nextId,
        name: name.text,
        img: 'assets/imgs/profile.png',
      ),
      roomId: roomId,
      centerId: centerId,
      instituteId: instituteId,
    );
    result.fold(
      (failure) {
        return emit(TeacherAddStateFailure(message: failure.message));
      },
      (message) {
        clear();

        return emit(TeacherAddStateSuccess(message: message));
      },
    );
  }

  final TextEditingController name = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void clear() {
    name.clear();
  }
}
