import 'package:controlpanel/core/routing/app_router.dart';
import 'package:controlpanel/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRoute;

  const MyApp({super.key, required this.appRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: ScreenUtilInit(
        designSize: const Size(402, 874),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          initialRoute: Routes.home,
          onGenerateRoute: appRoute.generateRoute,
        ),
      ),
    );
  }
}
