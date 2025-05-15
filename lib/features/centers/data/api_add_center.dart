import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/features/centers/data/model/center.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiAddCenter {
  final Dio _dio;

  ApiAddCenter({required Dio dio}) : _dio = dio;

  Future<Either<Failure, String>> addCenter(
    CenterModel center,
    int instituteId,
  ) async {
    try {
      final institute = institutes.firstWhere(
        (element) => element.id == instituteId,
      );
      institute.centers.add(center);

      return right('Added successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
