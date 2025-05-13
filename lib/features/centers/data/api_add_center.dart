import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/data/model/center.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiAddCenter {
  final Dio _dio;

  ApiAddCenter({required Dio dio}) : _dio = dio;

  Future<Either<Failure, String>> addCenter(CenterModel center) async {
    try {
      centers.add(center);

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
