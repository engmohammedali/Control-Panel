import 'package:controlpanel/data/model/stautant.dart';

sealed class StaudantState {}

final class StaudantStateInitial extends StaudantState {}

final class StaudantStateLoading extends StaudantState {}

final class StaudantStateFailure extends StaudantState {
  final String message;
  StaudantStateFailure({required this.message});
}

final class StaudantStateSuccess extends StaudantState {
  final List<Staudant> students;
  StaudantStateSuccess({required this.students});
}

final class StaudantAddStateLoading extends StaudantState {}

final class StaudantAddStateSuccess extends StaudantState {
  final String message;
  StaudantAddStateSuccess({required this.message});
}

final class StaudantAddStateFailure extends StaudantState {
  final String message;
  StaudantAddStateFailure({required this.message});
}
