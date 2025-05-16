import 'package:controlpanel/features/centers/data/model/center.dart';

sealed class CenterState {}
final class CenterStateFeathInitial extends CenterState {}
final class CenterStateFeathLoading extends CenterState {}
final class CenterStateFeathFailure extends CenterState {
  final String message;
  CenterStateFeathFailure({required this.message});
}
final class CenterStateFeathSuccess extends CenterState {
  final List<CenterModel> centers;
  CenterStateFeathSuccess({ required this.centers});
}

  


final class CenterStateLoading extends CenterState {}

final class CenterStateSuccess extends CenterState {
  final String message;
  CenterStateSuccess({required this.message});
}

final class CenterStateFailure extends CenterState {
  final String message;
  CenterStateFailure({required this.message});
}
