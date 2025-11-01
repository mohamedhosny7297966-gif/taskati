import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/feature/auth/presentation/auth_screen.dart';
import 'package:taskati/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:taskati/feature/home/presentation/home_screen.dart';
import 'package:taskati/feature/splash/presentation/splash_screen.dart';

class AppRoutes {
  static Route<dynamic>? routes(RouteSettings setting) {
    switch (setting.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routes.authScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => AuthCubit(),
              child: AuthScreen(),
            ));
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());


    }
  }
}