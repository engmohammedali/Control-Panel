import 'package:controlpanel/features/dashboard/data/model/institute.dart';
import 'package:controlpanel/features/dashboard/data/model/lesson.dart';
import 'package:controlpanel/features/dashboard/data/api_add_institute.dart';
import 'package:controlpanel/features/dashboard/data/api_get_institutes.dart';
import 'package:controlpanel/features/dashboard/logic/institutes_bloc/institutes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstitutesCubit extends Cubit<InstitutesState> {
  final ApiGetInstitutes _apiGetInstitutes;
  final ApiAddInstitute _apiAddInstitute;
  InstitutesCubit(this._apiGetInstitutes, this._apiAddInstitute)
    : super(InstitutesFeathStateInitial());

  Future<void> feathInstitutesCubit() async {
    emit(InstitutesFeathStateLoading());
    final result = await _apiGetInstitutes.getInstitute();
    result.fold(
      (failure) {
        return emit(InstitutesFeathStateFailure(message: failure.message));
      },
      (institutes) {
        return emit(InstitutesFeathStateSuccess(institutes));
      },
    );
  }

  Future<void> addInstituteCubit() async {
    emit(InstitutesAddStateLoading());
    final result = await _apiAddInstitute.addInstitute(
      Institute(
        centers: [],
        id: Institute.nextId,
        name: name.text.trim(),
        location: location.text.trim(),
        lessons: [
          Lesson(
            id: Lesson.nextId,
            title: lesson1.text.trim(),
            description: description1.text.trim(),
          ),
          Lesson(
            id: Lesson.nextId,
            title: lesson2.text.trim(),
            description: description2.text.trim(),
          ),
          Lesson(
            id: Lesson.nextId,
            title: lesson3.text.trim(),
            description: description3.text.trim(),
          ),
          Lesson(
            id: Lesson.nextId,
            title: lesson4.text.trim(),
            description: description4.text.trim(),
          ),
          Lesson(
            id: Lesson.nextId,
            title: lesson5.text.trim(),
            description: description5.text.trim(),
          ),
        ],
      ),
    );
    result.fold(
      (failure) {
        return emit(InstitutesAddStateFailure(message: failure.message));
      },
      (message) {
        clear();
        return emit(InstitutesAddStateSuccess(message: message));
      },
    );
  }

  final TextEditingController name = TextEditingController();

  final TextEditingController location = TextEditingController();

  final TextEditingController lesson1 = TextEditingController();
  final TextEditingController lesson2 = TextEditingController();
  final TextEditingController lesson3 = TextEditingController();
  final TextEditingController lesson4 = TextEditingController();
  final TextEditingController lesson5 = TextEditingController();

  final TextEditingController description1 = TextEditingController();
  final TextEditingController description2 = TextEditingController();
  final TextEditingController description3 = TextEditingController();
  final TextEditingController description4 = TextEditingController();
  final TextEditingController description5 = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void clear() {
    name.clear();
    location.clear();
    lesson1.clear();
    lesson2.clear();
    lesson3.clear();
    lesson4.clear();
    lesson5.clear();
  }
}
