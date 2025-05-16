import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/features/rooms/data/model/room.dart';
import 'package:controlpanel/features/students/data/model/student.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiAddStudent {
  final Dio _dio;

  ApiAddStudent({required Dio dio}) : _dio = dio;

  Future<Either<Failure, String>> addStudent({
    required Student student,
    required int instituteId,
    required int centerId,
  }) async {
    try {
      final institute = institutes.firstWhere(
        (element) => element.id == instituteId,
      );
      final center = institute.centers.firstWhere(
        (element) => element.id == centerId,
      );

      final Room room = center.rooms!.firstWhere(
        (element) => element.id == student.roomId,
      );
      room.students!.add(student);

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
