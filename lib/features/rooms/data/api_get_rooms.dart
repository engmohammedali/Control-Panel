import 'package:controlpanel/core/error/failure.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/features/rooms/data/model/room.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiGetRooms {
  final Dio _dio;

  ApiGetRooms({required Dio dio}) : _dio = dio;

  Future<Either<Failure, List<Room>>> getRooms({
    required int centerId,
    required int instituteId,
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

      final institute = institutes.firstWhere(
        (element) => element.id == instituteId,
      );
      final center = institute.centers.firstWhere(
        (element) => element.id == centerId,
      );
      if (center.rooms == null || center.rooms!.isEmpty) {
        return left(ServerFailure(message: 'No Rooms Found'));
      }
      final room = center.rooms ?? [];

      await Future.delayed(Duration(seconds: 1));

      return right(room);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
