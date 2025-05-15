import 'package:controlpanel/features/dashboard/data/model/institute.dart';

sealed class InstitutesState {}

final class InstitutesFeathStateInitial extends InstitutesState {}

final class InstitutesFeathStateLoading extends InstitutesState {}

final class InstitutesFeathStateFailure extends InstitutesState {
  final String message;
  InstitutesFeathStateFailure({required this.message});
}

final class InstitutesFeathStateSuccess extends InstitutesState {
  final List<Institute> institutes;

  InstitutesFeathStateSuccess(this.institutes);
}

final class InstitutesAddStateLoading extends InstitutesState {}

final class InstitutesAddStateSuccess extends InstitutesState {
  final String message;
  InstitutesAddStateSuccess({required this.message});
}

final class InstitutesAddStateFailure extends InstitutesState {
  final String message;
  InstitutesAddStateFailure({required this.message});
}
