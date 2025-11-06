import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show ThemeData;
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:taskati/core/helper/app_string.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  var box=Hive.box(AppString.themeBox);

  ThemeData appTheme=Hive.box(AppString.themeBox).get("is Dark")?? false?ThemeData.dark(): ThemeData.light();

  changeTheme(){
    if(appTheme==ThemeData.light()){
      appTheme=ThemeData.dark();
      box.put("is Dark", true);
    }else{
      appTheme=ThemeData.light();
      box.put("is Dark", false);
    }
  emit(ThemeApp());
  }
}
