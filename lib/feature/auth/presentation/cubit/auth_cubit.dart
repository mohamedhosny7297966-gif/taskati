import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskati/feature/auth/data/repo/auth_repo.dart';
import 'package:taskati/feature/auth/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  saveUserData(UserModel user)async{
    emit(SaveUserLoading());
    final response=await AuthRepo.saveUserData(user);
    if(response){
      emit(SaveUserSuccess());
    }else{
      emit(SaveUserError());
    }
  }

}
