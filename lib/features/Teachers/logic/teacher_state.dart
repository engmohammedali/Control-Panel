import 'package:controlpanel/features/Teachers/data/model/teacher.dart';

sealed class TeacherState {}

final class TeacherStateInitial extends TeacherState {}

final class TeacherStateLoading extends TeacherState {}

final class TeacherStateFailure extends TeacherState {
  final String message;
  TeacherStateFailure({required this.message});
}

final class TeacherStateSuccess extends TeacherState {
  final Teacher teacher;
  TeacherStateSuccess({required this.teacher});
}

final class TeacherAddStateLoading extends TeacherState {}

final class TeacherAddStateSuccess extends TeacherState {
  final String message;
  TeacherAddStateSuccess({required this.message});
}

final class TeacherAddStateFailure extends TeacherState {
  final String message;
  TeacherAddStateFailure({required this.message});
}
