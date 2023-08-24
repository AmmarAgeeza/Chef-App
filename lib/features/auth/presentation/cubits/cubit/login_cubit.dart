import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  GlobalKey<FormState> loginKey=GlobalKey<FormState>();
  TextEditingController emailController= TextEditingController(); 
  TextEditingController passwordController= TextEditingController();
  bool isLoginPasswordShowing= true;
  IconData suffixIcon = Icons.visibility;
  void changeLoginPasswordSuffixIcon(){
    isLoginPasswordShowing=!isLoginPasswordShowing;
    suffixIcon=isLoginPasswordShowing?Icons.visibility:Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }
}
