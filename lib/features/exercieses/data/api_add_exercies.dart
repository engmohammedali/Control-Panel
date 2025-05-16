import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/features/exercieses/data/model/exercies.dart';
import 'package:controlpanel/features/rooms/data/model/room.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiAddExercies {
  final Dio _dio;

  ApiAddExercies({required Dio dio}) : _dio = dio;

  Future<Either<Failure, String>> addExercies({
    required Exercies exercies,
    required int instituteId,
    required int centerId,
    required int roomId,

    required int lessonId,
  }) async {
    try {
      final institute = institutes.firstWhere(
        (element) => element.id == instituteId,
      );
      final center = institute.centers.firstWhere(
        (element) => element.id == centerId,
      );

      final Room room = center.rooms!.firstWhere(
        (element) => element.id == roomId,
      );

      final lesson = room.lessons!.firstWhere(
        (element) => element.id == lessonId,
      );
      lesson.exercieses?.add(exercies);

      await Future.delayed(Duration(seconds: 3));
      return right('Added successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
