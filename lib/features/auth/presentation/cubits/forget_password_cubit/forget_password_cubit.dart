import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/auth_repository.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepository) : super(ForgetPasswordInitial());
  final AuthRepository authRepository;
  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>(debugLabel: '2');
  TextEditingController emailController = TextEditingController();
  void sendCode() async {
    emit(SendCodeLoading());
    final res = await authRepository.sendCode(emailController.text);
    res.fold((l) => emit(SendCodeError(l)), (r) => emit(SendCodeSucess(r)));
  }

  //! reset password logic
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>(debugLabel: '1');

  //* new password text field
  TextEditingController newPasswordController = TextEditingController();
  bool isNewPasswordShowing = true;
  IconData suffixIconNewPassword = Icons.visibility;
  void changeNewPasswordSuffixIcon() {
    isNewPasswordShowing = !isNewPasswordShowing;
    suffixIconNewPassword =
        isNewPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeNewPasswordSuffixIcon());
  }

  //* confirm password text field
  TextEditingController confirmPasswordController = TextEditingController();
  bool isConfirmPasswordShowing = true;
  IconData suffixIconConfirmPassword = Icons.visibility;
  void changeConfrimPasswordSuffixIcon() {
    isConfirmPasswordShowing = !isConfirmPasswordShowing;
    suffixIconConfirmPassword =
        isConfirmPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }

  //* Code
  TextEditingController codeController = TextEditingController();

  //change password method that
  // recives new password and confirm password and code and email
  void resetPassword() async {
    emit(ResetPasswordLoading());
    final res = await authRepository.resetPassword(
      email: emailController.text,
      password: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
      code: codeController.text,
    );
    res.fold((l) => emit(ResetPasswordError(l)),
        (r) => emit(ResetPassworddeSucess(r)));
  }
}
