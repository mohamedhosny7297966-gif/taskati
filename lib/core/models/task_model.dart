
import 'package:hive/hive.dart';
part 'task_model.g.dart';
@HiveType(typeId: 1)
class TaskModel{
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String date;
  @HiveField(3)
  String startTime;
  @HiveField(4)
  String endTime;
  @HiveField(5)
  String status;
  @HiveField(6)
  int color;

  TaskModel({required this.title, required this.description, required this.date, required this.startTime,
      required this.endTime, this.status="ToDo", required this.color}
      );

}
List<TaskModel>tasks=[
];