import 'package:food_shop/src/core/resources/constants.dart';
import 'package:food_shop/src/core/resources/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  App({super.key});

  final RouteGenerator routeGenerator = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, state) {
        return MaterialApp(
          locale: const Locale('en', 'US'),
          title: AppConstants.appName,
          onGenerateRoute: routeGenerator.getRoute,
          initialRoute: Routes.authScreen,
        );
      },
    );
  }
}
