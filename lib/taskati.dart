

import 'package:flutter/material.dart';
import 'package:taskati/core/routes/app_routes.dart';
import 'package:taskati/feature/auth/presentation/auth_screen.dart';
import 'package:taskati/feature/splash/presentation/splash_screen.dart';

import 'core/routes/routes.dart';

class Taskati extends StatelessWidget {
  const Taskati({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.routes,
      initialRoute: Routes.splashScreen,
    );
  }
}
