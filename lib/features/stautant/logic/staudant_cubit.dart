import 'package:controlpanel/data/model/stautant.dart';
import 'package:controlpanel/features/stautant/data/api_add_staudant.dart';
import 'package:controlpanel/features/stautant/data/api_get_staudant.dart';
import 'package:controlpanel/features/stautant/logic/staudant_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaudantCubit extends Cubit<StaudantState> {
  final ApiAddStudent _addStudent;
  final ApiGetStudent _getStudent;

  StaudantCubit(this._addStudent, this._getStudent)
    : super(StaudantStateInitial());

  Future<void> fetchStudentsCubit() async {
    emit(StaudantStateLoading());
    final result = await _getStudent.getStudent();
    result.fold(
      (failure) {
        return emit(StaudantStateFailure(message: failure.message));
      },
      (students) {
        return emit(StaudantStateSuccess(students: students));
      },
    );
  }

  Future<void> addStudentCubit() async {
    emit(StaudantAddStateLoading());
    final result = await _addStudent.addStudent(
      Staudant(
        id: 1,
        name: name.text.trim(),
        classId: 1,
        className: 'class 1',
        teacherName: 'teacher 1',
      ),
    );
    result.fold(
      (failure) {
        return emit(StaudantAddStateFailure(message: failure.message));
      },
      (message) {
        clear();

        return emit(StaudantAddStateSuccess(message: message));
      },
    );
  }

  final TextEditingController name = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void clear() {
    name.clear();
  }
}
