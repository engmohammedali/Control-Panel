import 'package:controlpanel/features/lessons/data/api_add_lesson.dart';
import 'package:controlpanel/features/lessons/data/api_get_lessons.dart';
import 'package:controlpanel/features/lessons/data/model/lesson.dart';
import 'package:controlpanel/features/lessons/logic/lesson_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonCubit extends Cubit<LessonState> {
  final ApiAddLesson _addLesson;
  final ApiGetLessons _getLessons;

  LessonCubit(this._addLesson, this._getLessons) : super(LessonStateInitial());

  Future<void> fetchLessonsCubit({
    required int instituteId,
    required int centerId,
    required int roomId,
  }) async {
    emit(LessonStateLoading());
    final result = await _getLessons.getLessons(
      instituteId: instituteId,
      centerId: centerId,
      roomId: roomId,
    );
    result.fold(
      (failure) {
        return emit(LessonStateFailure(message: failure.message));
      },
      (lessons) {
        return emit(LessonStateSuccess(lessons: lessons));
      },
    );
  }

  Future<void> addLessonCubit({
    required int instituteId,
    required int centerId,
    required int roomId,
  }) async {
    emit(LessonAddStateLoading());
    final result = await _addLesson.addLesson(
      lesson: Lesson(
        id: Lesson.nextId,
        title: title.text.trim(),
        description: description.text.trim(),
        exercieses: [],
      ),
      instituteId: instituteId,
      centerId: centerId,
      roomId: roomId,
    );
    result.fold(
      (failure) {
        return emit(LessonAddStateFailure(message: failure.message));
      },
      (message) {
        clear();

        return emit(LessonAddStateSuccess(message: message));
      },
    );
  }

  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void clear() {
    title.clear();
    description.clear();
  }
}
