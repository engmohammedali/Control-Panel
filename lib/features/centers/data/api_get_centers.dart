// import 'package:controlpanel/core/error/failure.dart';
// import 'package:controlpanel/core/helpers/shared_helpers.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class ApiGetCenters {
//   final Dio _dio;

//   ApiGetCenters({required Dio dio}) : _dio = dio;

//   Future<Either<Failure, List<Center>>> getCenters() async {
//     try {
//       await Future.delayed(Duration(seconds: 5));
//       // var response = await _dio.get(
//       //   '',
//       //   options: Options(
//       //     headers: {
//       //       "Authorization":
//       //           "Bearer ${await SharedPrefHelper.getString("userToken")}",
//       //     },
//       //   ),
//       // );

//       // final centers =
//       //     (response.data['lists'] as List)
//       //         .map((e) => Center.fromJson(e))
//       //         .toList();



      
//       return Right(centers);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(message: e.toString()));
//     }
//   }
// }
