

import 'package:hive/hive.dart';
import 'package:taskati/core/helper/app_string.dart';
import 'package:taskati/core/models/task_model.dart';

class TaskRepo{

 static var box=Hive.box<TaskModel>(AppString.tasksBox);
 static addTask(TaskModel task)async {
   try{
  await box.add(task);
  return true;
 }catch(e){
     return false;
   }
  }
  static getLocalTasks(){
   tasks=box.values.toList();
  }
   static  deleteTask(int index){
   box.deleteAt(index);
     }
 }