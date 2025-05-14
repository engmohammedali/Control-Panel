import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/data/model/stautant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiAddStudent  {
  final Dio _dio;

  ApiAddStudent({required Dio dio}) : _dio = dio;

  Future<Either<Failure, String>> addStudent(Staudant staudant) async {
    try {
      students.add(staudant);

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
