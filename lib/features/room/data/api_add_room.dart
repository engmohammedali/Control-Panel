import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/data/model/classes.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiAddRoom { 
  final Dio _dio;

  ApiAddRoom({required Dio dio}) : _dio = dio;

  Future<Either<Failure, String>> addRoom(Room roomData) async {
    try {
      rooms.add(roomData);

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
