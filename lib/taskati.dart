import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskati/core/routes/app_routes.dart';
import 'package:taskati/core/theme/cubit/theme_cubit.dart';
import 'package:taskati/feature/auth/presentation/auth_screen.dart';
import 'package:taskati/feature/splash/presentation/splash_screen.dart';

import 'core/routes/routes.dart';

class Taskati extends StatelessWidget {
  const Taskati({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: context.read<ThemeCubit>().appTheme,
            onGenerateRoute: AppRoutes.routes,
            initialRoute: Routes.splashScreen,
          );
        },
      ),
    );
  }
}
