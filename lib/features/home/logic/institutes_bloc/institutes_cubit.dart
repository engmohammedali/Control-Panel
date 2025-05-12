import 'package:controlpanel/data/model/institute.dart';
import 'package:controlpanel/features/home/data/api_add_institutes.dart';
import 'package:controlpanel/features/home/data/api_get_institutes.dart';
import 'package:controlpanel/features/home/logic/institutes_bloc/institutes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstitutesCubit extends Cubit<InstitutesState> {
  final ApiGetInstitutes _apiGetInstitutes;
  final ApiAddInstitutes _apiAddInstitutes;
  InstitutesCubit(this._apiGetInstitutes, this._apiAddInstitutes)
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

  Future<void> addInstitutesCubit() async {
    emit(InstitutesAddStateLoading());
    final result = await _apiAddInstitutes.addInstitutes(
      Institute(
        centers: [],
        id: 1,
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
