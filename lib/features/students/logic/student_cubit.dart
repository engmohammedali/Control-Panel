import 'package:controlpanel/features/students/data/api_add_student.dart';
import 'package:controlpanel/features/students/data/api_get_student.dart';
import 'package:controlpanel/features/students/data/model/student.dart';
import 'package:controlpanel/features/students/logic/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubit extends Cubit<StudentState> {
  final ApiAddStudent _addStudent;
  final ApiGetStudent _getStudent;

  StudentCubit(this._addStudent, this._getStudent)
    : super(StudentStateInitial());

  Future<void> fetchStudentsCubit({
    required int instituteId,
    required int centerId,
    required int roomId,
  }) async {
    emit(StudentStateLoading());
    final result = await _getStudent.getStudent(
      instituteId: instituteId,
      centerId: centerId,
      roomId: roomId,
    );
    result.fold(
      (failure) {
        return emit(StudentStateFailure(message: failure.message));
      },
      (students) {
        return emit(StudentStateSuccess(students: students));
      },
    );
  }

  Future<void> addStudentCubit({
    required int instituteId,
    required int centerId,
    required int roomId,
  }) async {
    emit(StudentAddStateLoading());
    final result = await _addStudent.addStudent(
      student: Student(
        id: Student.nextId,
        name: name.text.trim(),
        className: 'class 1',
        teacherName: 'teacher 1',
        img: 'assets/imgs/profile.png',
        roomId: roomId,
      ),
      instituteId: instituteId,
      centerId: centerId,
    );
    result.fold(
      (failure) {
        return emit(StudentAddStateFailure(message: failure.message));
      },
      (message) {
        clear();

        return emit(StudentAddStateSuccess(message: message));
      },
    );
  }

  final TextEditingController name = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void clear() {
    name.clear();
  }
}
