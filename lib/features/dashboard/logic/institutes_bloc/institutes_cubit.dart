import 'package:controlpanel/features/dashboard/data/api_add_institute.dart';
import 'package:controlpanel/features/dashboard/data/api_get_institutes.dart';
import 'package:controlpanel/features/dashboard/data/model/institute.dart';
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

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void clear() {
    name.clear();
    location.clear();
  }
}
