import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/features/exercieses/data/model/exercies.dart';
import 'package:controlpanel/features/rooms/data/model/room.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiGetExercies {
  final Dio _dio;

  ApiGetExercies({required Dio dio}) : _dio = dio;

  Future<Either<Failure, List<Exercies>>> getExercies({

    required int instituteId,
    required int centerId,
    required int roomId,

    required int lessonId,
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

      final lesson = room.lessons!.firstWhere(
        (element) => element.id == lessonId,
      );
      final List<Exercies> exercieses = lesson.exercieses ?? [];
      if (exercieses.isEmpty) {
        return left(ServerFailure(message: 'No Exercies Found'));
      } else {
        return right(exercieses);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
