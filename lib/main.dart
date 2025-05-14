import 'package:controlpanel/core/helpers/app_observer.dart';
import 'package:controlpanel/core/routing/app_router.dart';
import 'package:controlpanel/core/services/dependency_injection.dart';
import 'package:controlpanel/data.dart';
import 'package:controlpanel/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();
  initializeData();
  Bloc.observer = AppBlocObserver();
  ServicesLocator().setupGetIt();
  runApp(MyApp(appRoute: AppRouter()));
}
