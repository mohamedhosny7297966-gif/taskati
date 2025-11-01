

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/helper/app_string.dart';
import 'package:taskati/feature/auth/models/user_model.dart';
import 'package:taskati/taskati.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(AppString.userBox);
  runApp(Taskati());
}