import 'package:controlpanel/core/networking/dio_factory.dart';
import 'package:controlpanel/features/centers/data/api_add_center.dart';
import 'package:controlpanel/features/centers/data/api_get_center.dart';
import 'package:controlpanel/features/centers/logic/center_cubit.dart';
import 'package:controlpanel/features/home/data/api_add_institute.dart';
import 'package:controlpanel/features/home/data/api_get_institutes.dart';
import 'package:controlpanel/features/home/logic/institutes_bloc/institutes_cubit.dart';
import 'package:controlpanel/features/room/data/api_add_room.dart';
import 'package:controlpanel/features/room/data/api_get_rooms.dart';
import 'package:controlpanel/features/room/logic/room_cubit.dart';
import 'package:controlpanel/features/stautant/data/api_add_staudant.dart';
import 'package:controlpanel/features/stautant/data/api_get_staudant.dart';
import 'package:controlpanel/features/stautant/logic/staudant_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void setupGetIt() async {
    _setupHome();
    _setUpCenter();
    _setUpRoom();
    _setUpStaudant();
  }

  _setupHome() {
    // bloc
    getIt.registerFactory(() => InstitutesCubit(getIt(), getIt()));
    // api
    getIt.registerLazySingleton<ApiGetInstitutes>(
      () => ApiGetInstitutes(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiAddInstitute>(
      () => ApiAddInstitute(dio: DioFactory.getDio()),
    );
  }

  _setUpCenter() {
    getIt.registerFactory(() => CenterCubit(getIt(), getIt()));
    getIt.registerLazySingleton<ApiAddCenter>(
      () => ApiAddCenter(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiGetCenter>(
      () => ApiGetCenter(dio: DioFactory.getDio()),
    );
  }

  _setUpRoom() {
    // bloc
    getIt.registerFactory(() => RoomCubit(getIt(), getIt()));
    // api
    getIt.registerLazySingleton<ApiGetRooms>(
      () => ApiGetRooms(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiAddRoom>(
      () => ApiAddRoom(dio: DioFactory.getDio()),
    );
  } 


  _setUpStaudant() {
    getIt.registerFactory(() => StaudantCubit(getIt(), getIt()));
    getIt.registerLazySingleton<ApiGetStudent>(
      () => ApiGetStudent(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiAddStudent>(
      () => ApiAddStudent(dio: DioFactory.getDio()),
    );
  }

}
