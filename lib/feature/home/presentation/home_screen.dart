import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/core/theme/app_text_style.dart';
import 'package:taskati/core/theme/cubit/theme_cubit.dart';
import 'package:taskati/core/widget/custom_button.dart';
import 'package:taskati/feature/add_task/data/repo/task_repo.dart';
import 'package:taskati/feature/home/data/repo/home_repo.dart';
import 'package:taskati/feature/home/presentation/widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  @override
  void initState() {
    TaskRepo.getLocalTasks();
    super.initState();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(HomeRepo.getUserData()?.name ?? ""),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: Image.file(
                      File(HomeRepo.getUserData()?.image ?? ""),
                    ).image,
                  ),
                  Switch(
                      value:
                      context.read<ThemeCubit>().appTheme == ThemeData.dark(),
                      onChanged: (v) {
                        context.read<ThemeCubit>().changeTheme();
                      })
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      DateFormat("EEEE, dd MMMM yyyy")
                          .format(DateTime.now()),
                      style: AppTextStyle.font20Bold,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                      width: 150,
                      child: CustomButton(
                          onTap: () async{
                          await  Navigator.pushNamed(context, Routes.addTaskScreen);
                            setState(() {

                            });
                          }, title: "Add task")),],
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                visible: tasks.isNotEmpty,
                child: Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => Dismissible(
                      key: UniqueKey(),
                      confirmDismiss: (direction)async{
                       await TaskRepo.deleteTask(index);
                       tasks.removeAt(index);
                       setState(() {

                       });
                      },
                      child: TaskItem(
                      task: tasks[index],
                    ),),
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: tasks.length,
                  ),
                ),
                replacement: Lottie.asset("assets/images/empty Tasks.json"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
