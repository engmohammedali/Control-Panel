import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/data/model/center.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiGetCenter {
  final Dio _dio;

  ApiGetCenter({required Dio dio}) : _dio = dio;

  Future<Either<Failure, List<CenterModel>>> getCenter() async {
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

      return right(centers);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
