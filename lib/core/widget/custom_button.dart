

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/theme/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final String title;

  final void Function()? onTap;
  const CustomButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
     child:  Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(colors:[
          Colors.deepPurpleAccent,
          Colors.deepPurple.withValues(alpha: .6),

        ],begin: Alignment.topCenter,
        end: Alignment.bottomCenter),
      ),
      child: Text(title,style: AppTextStyle.font20Bold.copyWith(color: Colors.white),),
    ),);
  }
}
