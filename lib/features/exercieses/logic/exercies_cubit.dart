import 'package:controlpanel/features/exercieses/data/api_add_exercies.dart';
import 'package:controlpanel/features/exercieses/data/api_get_exercies.dart';
import 'package:controlpanel/features/exercieses/data/model/exercies.dart';
import 'package:controlpanel/features/exercieses/logic/exercies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciesCubit extends Cubit<ExerciesState> {
  final ApiAddExercies _addExercies;
  final ApiGetExercies _getExercies;

  ExerciesCubit(this._addExercies, this._getExercies)
    : super(ExerciesStateInitial());

  Future<void> fetchExerciesCubit({
    required int instituteId,
    required int centerId,
    required int roomId,
    required int lessonId,
  }) async {
    emit(ExerciesStateLoading());
    final result = await _getExercies.getExercies(
      instituteId: instituteId,
      centerId: centerId,
      roomId: roomId,
      lessonId: lessonId,
    );
    result.fold(
      (failure) {
        return emit(ExerciesStateFailure(message: failure.message));
      },
      (exercieses) {
        return emit(ExerciesStateSuccess(exercieses: exercieses));
      },
    );
  }

  Future<void> addExerciesCubit({
    required int instituteId,
    required int centerId,
    required int roomId,
    required int lessonId,
  }) async {
    emit(ExerciesAddStateLoading());
    final result = await _addExercies.addExercies(
      exercies: Exercies(
        id: Exercies.nextId,
        title: title.text.trim(),
        description: description.text.trim(),
      ),
      instituteId: instituteId,
      centerId: centerId,
      roomId: roomId,
      lessonId: lessonId,
    );
    result.fold(
      (failure) {
        return emit(ExerciesAddStateFailure(message: failure.message));
      },
      (message) {
        clear();

        return emit(ExerciesAddStateSuccess(message: message));
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
