import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/features/rooms/data/model/room.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiAddRoom {
  final Dio _dio;

  ApiAddRoom({required Dio dio}) : _dio = dio;

  Future<Either<Failure, String>> addRoom({
    required int instituteId,
    required int centerId,
    required Room room,
  }) async {
    try {
      final institute = institutes.firstWhere(
        (element) => element.id == instituteId,
      );
      final center = institute.centers.firstWhere(
        (element) => element.id == centerId,
      );
      center.rooms!.add(room);

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
