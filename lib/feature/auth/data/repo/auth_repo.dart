
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/helper/app_string.dart';
import 'package:taskati/feature/auth/models/user_model.dart';

class AuthRepo{
static var box=Hive.box<UserModel>(AppString.userBox);
 static saveUserData(UserModel user)async{
  try{
   await box.put(AppString.userKey, user);
    return true;
  }catch(e){
    return false;
  }
}
}