import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/features/lessons/data/model/lesson.dart';
import 'package:controlpanel/features/rooms/data/model/room.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiGetLessons {
  final Dio _dio;

  ApiGetLessons({required Dio dio}) : _dio = dio;

  Future<Either<Failure, List<Lesson>>> getLessons({
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
      final Room room = center.rooms!.firstWhere(
        (element) => element.id == roomId,
      );
      final List<Lesson> lessons = room.lessons ?? [];

      return right(lessons);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
