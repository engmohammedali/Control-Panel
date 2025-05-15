
import 'package:controlpanel/features/students/data/model/student.dart';

sealed class StudentState {}

final class StudentStateInitial extends StudentState {}

final class StudentStateLoading extends StudentState {}

final class StudentStateFailure extends StudentState {
  final String message;
  StudentStateFailure({required this.message});
}

final class StudentStateSuccess extends StudentState {
  final List<Student> students;
  StudentStateSuccess({required this.students});
}

final class StudentAddStateLoading extends StudentState {}

final class StudentAddStateSuccess extends StudentState {
  final String message;
  StudentAddStateSuccess({required this.message});
}

final class StudentAddStateFailure extends StudentState {
  final String message;
  StudentAddStateFailure({required this.message});
}
