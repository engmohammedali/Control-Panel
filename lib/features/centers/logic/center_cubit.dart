import 'package:controlpanel/features/centers/data/api_add_center.dart';
import 'package:controlpanel/features/centers/data/api_get_center.dart';
import 'package:controlpanel/features/centers/data/model/center.dart';
import 'package:controlpanel/features/centers/logic/center_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenterCubit extends Cubit<CenterState> {
  final ApiAddCenter _addCenter;
  final ApiGetCenter _getCenter;

  CenterCubit(this._addCenter, this._getCenter) : super(CenterStateInitial());

  Future<void> fetchCentersCubit(int instituteId) async {
    emit(CenterStateFeathLoading());
    final result = await _getCenter.getCenter(instituteId);
    result.fold(
      (failure) {
        return emit(CenterStateFeathFailure(message: failure.message));
      },
      (centers) {
        return emit(CenterStateFeathSuccess(centers: centers));
      },
    );
  }

  Future<void> addCenterCubit(int instituteId) async {
    emit(CenterStateLoading());
    final result = await _addCenter.addCenter(
      CenterModel(id: CenterModel.nextId, name: name.text.trim()),
      instituteId,
    );
    result.fold(
      (failure) {
        return emit(CenterStateFailure(message: failure.message));
      },
      (message) {
        clear();

        return emit(CenterStateSuccess(message: message));
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
