import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/theme/app_text_style.dart';
import 'package:taskati/feature/auth/presentation/auth_screen.dart';
import 'package:taskati/feature/home/data/repo/home_repo.dart';
import '../../../core/routes/routes.dart';
import '../../../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  navigateToNextScreen();
  super.initState();
  }
  navigateToNextScreen(){
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushNamedAndRemoveUntil(context, HomeRepo.getUserData()!=null?Routes.homeScreen :Routes.authScreen, (_)=>false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(Assets.images.taskDone),
            Text("Taskati", style: AppTextStyle.font20Bold,),
            SizedBox(height: 20,),
            Text("It's Time to get Organized", style: AppTextStyle.font16Gray,),



          ],
        ),
      ),
    );
  }
}
