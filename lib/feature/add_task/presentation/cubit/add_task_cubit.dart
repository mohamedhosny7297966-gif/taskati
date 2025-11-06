import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/feature/add_task/data/repo/task_repo.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  addTask(TaskModel tasks)async{
    emit( AddTaskLoading());
    final response=await TaskRepo.addTask(tasks);
    if(response){
      emit(AddTaskSuccess());
    }else{
      emit(AddTaskError());
    }
  }
}
