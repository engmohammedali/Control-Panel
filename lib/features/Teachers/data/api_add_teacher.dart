import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/features/Teachers/data/model/teacher.dart';
import 'package:controlpanel/features/rooms/data/model/room.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiAddTeacher {
  final Dio _dio;

  ApiAddTeacher({required Dio dio}) : _dio = dio;

  Future<Either<Failure, String>> addTeacher({
    required Teacher teacher,
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
      final Teacher? existingTeacher = room.teacher;
      if (existingTeacher != null) {
        return left(ServerFailure(message: 'Teacher already exists'));
      }

      teachers.add(teacher);

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
