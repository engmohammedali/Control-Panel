import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/features/dashboard/data/model/institute.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiAddInstitute {
  final Dio _dio;

  ApiAddInstitute({required Dio dio}) : _dio = dio;

  Future<Either<Failure, String>> addInstitute(Institute institute) async {
    try {
      institutes.add(institute);
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
