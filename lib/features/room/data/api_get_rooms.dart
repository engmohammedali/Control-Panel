import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/data/model/classes.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiGetRooms {
  final Dio _dio;

  ApiGetRooms({required Dio dio}) : _dio = dio;

  Future<Either<Failure, Room>> getRoom() async {
    try {
      //   var response = await _dio.get(
      //     '',
      //     options: Options(
      //       headers: {
      //         "Authorization":
      //             "Bearer ${await SharedPrefHelper.getString("userToken")}",
      //       },
      //     ),
      //   );

      await Future.delayed(Duration(seconds: 1));

      return right(rooms.where((element) => element.id == 1).first);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
