import 'package:controlpanel/core/networking/dio_factory.dart';
import 'package:controlpanel/features/centers/data/api_add_center.dart';
import 'package:controlpanel/features/centers/data/api_get_center.dart';
import 'package:controlpanel/features/centers/logic/center_cubit.dart';
import 'package:controlpanel/features/home/data/api_add_institute.dart';
import 'package:controlpanel/features/home/data/api_get_institutes.dart';
import 'package:controlpanel/features/home/logic/institute_bloc/institutes_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void setupGetIt() async {
    _setupHome();
    _setUpCenter();
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
}
