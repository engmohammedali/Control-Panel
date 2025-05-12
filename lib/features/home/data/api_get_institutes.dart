import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data/model/center.dart';
import 'package:controlpanel/data/model/institute.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiGetInstitutes {
  final Dio _dio;

  ApiGetInstitutes({required Dio dio}) : _dio = dio;

  Future<Either<Failure, List<Institute>>> getInstitute() async {
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

      await Future.delayed(Duration(seconds: 5));

      final institute = Institute(
        centers: [
          CenterModel(name: 'mork', id: 1),
          CenterModel(name: 'mork', id: 1),
        ],
        id: 1,
        name: 'hama', location: 'homs',
      );

      return right([institute]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
