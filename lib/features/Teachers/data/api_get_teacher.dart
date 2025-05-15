import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/features/Teachers/data/model/teacher.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiGetTeacher {
  final Dio _dio;

  ApiGetTeacher({required Dio dio}) : _dio = dio;

  Future<Either<Failure, Teacher>> getTeacher({
    required int instituteId,
    required int centerId,
    required int roomId,
  }) async {
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

      final institute = institutes.firstWhere(
        (element) => element.id == instituteId,
      );
      final center = institute.centers.firstWhere(
        (element) => element.id == centerId,
      );
      final room = center.rooms!.firstWhere((element) => element.id == roomId);
      final teacher = room.teacher;
      if (teacher == null) {
        return left(ServerFailure(message: 'No Teachers Found'));
      } else {
        return right(teacher);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
