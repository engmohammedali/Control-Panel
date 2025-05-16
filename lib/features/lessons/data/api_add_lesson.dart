import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/features/lessons/data/model/lesson.dart';
import 'package:controlpanel/features/rooms/data/model/room.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiAddLesson {
  final Dio _dio;

  ApiAddLesson({required Dio dio}) : _dio = dio;

  Future<Either<Failure, String>> addLesson({
    required Lesson lesson,
    required int instituteId,
    required int centerId,
    required int roomId,
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
      room.lessons ??= [];
      room.lessons!.add(lesson);

      await Future.delayed(Duration(seconds: 1));
      return right('Added successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
