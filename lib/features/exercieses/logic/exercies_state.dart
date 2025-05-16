import 'package:controlpanel/features/exercieses/data/model/exercies.dart';

sealed class ExerciesState {}

final class ExerciesStateInitial extends ExerciesState {}

final class ExerciesStateLoading extends ExerciesState {}

final class ExerciesStateFailure extends ExerciesState {
  final String message;
  ExerciesStateFailure({required this.message});
}

final class ExerciesStateSuccess extends ExerciesState {
  final List<Exercies> exercieses;
  ExerciesStateSuccess({required this.exercieses});
}

final class ExerciesAddStateLoading extends ExerciesState {}

final class ExerciesAddStateSuccess extends ExerciesState {
  final String message;
  ExerciesAddStateSuccess({required this.message});
}

final class ExerciesAddStateFailure extends ExerciesState {
  final String message;
  ExerciesAddStateFailure({required this.message});
}
