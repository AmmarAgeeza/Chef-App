import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../../core/database/api/end_points.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../data/models/login_model.dart';
import '../../../data/repository/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepository authRepo;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>(debugLabel: '3');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginPasswordShowing = true;
  IconData suffixIcon = Icons.visibility;
  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordShowing = !isLoginPasswordShowing;
    suffixIcon =
        isLoginPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }

  // login method
  LoginModel? loginModel;
  void login() async {
    emit(LoginLoadingState());
    final result = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (l) => emit(LoginErrorState(l)),
      (r) async {
        loginModel = r;
        Map<String, dynamic> decodedToken = JwtDecoder.decode(r.token);
        await sl<CacheHelper>().saveData(
            key: ApiKeys.id,
            value: decodedToken[ApiKeys
                .id]); // {id: 6498d8d963385b3f9a0bcf3c, email: anas423999@gmail.com, name: Anas, iat: 1688680561}

        await sl<CacheHelper>().saveData(
          key: ApiKeys.token,
          value: r.token,
        );
        emit(LoginSucessState());
      },
    );
  }
}
