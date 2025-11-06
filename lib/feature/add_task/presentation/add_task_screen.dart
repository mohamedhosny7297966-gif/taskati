import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/widget/custom_button.dart';
import 'package:taskati/core/widget/custom_text_form%20_field.dart';
import 'package:taskati/feature/add_task/presentation/cubit/add_task_cubit.dart';
import 'package:taskati/feature/color_item/presentation/color_item.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var titleController=TextEditingController();
  var descriptionController=TextEditingController();
  var dateController=TextEditingController();
  var startTimeController=TextEditingController();
  var endTimeController=TextEditingController();
  int activeColor=0;
  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();

super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Add Task"),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(16),
        child: Column(
          spacing: 10,
          children: [
             CustomTextFormField(controller: titleController,labelText: "Title"),
             CustomTextFormField(
             controller: descriptionController
             ,labelText: "Description", maxLines: 5),
            CustomTextFormField(
            controller: dateController,
              labelText: "Date",
              suffixIcon:  Icon(Icons.date_range),
              readOnly: true,
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030)).then((v){
                    dateController.text=DateFormat.yMMMd().format(v!);
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(controller: startTimeController,
                    labelText: "Start Time",
                    suffixIcon:  Icon(Icons.timer_sharp),
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                        context: context, initialTime: TimeOfDay.now()).then((v){
                          startTimeController.text=v!.format(context);
                        }
                      );
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextFormField(controller: endTimeController,
                    labelText: "End Time",
                    suffixIcon:  Icon(Icons.timer_sharp),
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                        context: context, initialTime: TimeOfDay.now()).then((v){
                          endTimeController.text=v!.format(context);
                      }
                      );
                    },
                  ),
                ),
              ],
            ),
             SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ColorItem(
                  onTap: (){
                    setState(() {
                      activeColor=index;

                    });
                  },
                  color: taskColors[index],
                  isActive: index == activeColor,
                ),
                separatorBuilder: (context, index) =>
                 SizedBox(width: 10),
                itemCount: taskColors.length,
              ),
            ),
             SizedBox(height: 30),
            BlocListener<AddTaskCubit, AddTaskState>(
  listener: (context, state) {
    if (state is AddTaskLoading){
      showDialog(context: context, builder: (context)=>Center(
        child: CircularProgressIndicator(),
      ));
    }else if(state is AddTaskSuccess){
      Navigator.pop(context);
      Navigator.pop(context);
    }
            },
  child: CustomButton(
              title: "create Task",
              onTap: () {
                tasks.add(TaskModel(title: titleController.text,
                    description: descriptionController.text,
                    date: dateController.text,
                    startTime: startTimeController.text,
                    endTime: endTimeController.text, color: taskColors[activeColor].toARGB32())
                );
                context.read<AddTaskCubit>().addTask(TaskModel(title: titleController.text,
                    description: descriptionController.text,
                    date: dateController.text,
                    startTime: startTimeController.text,
                    endTime: endTimeController.text, color: taskColors[activeColor].toARGB32()));
              },
            ),
),
          ],
        ),
      ),
    );
  }
}
