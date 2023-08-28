import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/auth_repository.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepository) : super(ForgetPasswordInitial());
  final AuthRepository authRepository;
  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  void sendCode() async {
    emit(SendCodeLoading());
    final res = await authRepository.sendCode(emailController.text);
    res.fold((l) => emit(SendCodeError(l)), (r) => emit(SendCodeSucess(r)));
  }
}
