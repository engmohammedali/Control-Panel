import 'package:controlpanel/features/lessons/data/model/lesson.dart';

sealed class LessonState {}

final class LessonStateInitial extends LessonState {}

final class LessonStateLoading extends LessonState {}

final class LessonStateFailure extends LessonState {
  final String message;
  LessonStateFailure({required this.message});
}

final class LessonStateSuccess extends LessonState {
  final List<Lesson> lessons;
  LessonStateSuccess({required this.lessons});
}

final class LessonAddStateLoading extends LessonState {}

final class LessonAddStateSuccess extends LessonState {
  final String message;
  LessonAddStateSuccess({required this.message});
}

final class LessonAddStateFailure extends LessonState {
  final String message;
  LessonAddStateFailure({required this.message});
}
