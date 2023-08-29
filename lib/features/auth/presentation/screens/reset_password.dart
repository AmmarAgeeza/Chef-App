import 'package:chef_app/core/locale/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/cusotm_lodaing_indicator.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../cubits/forget_password_cubit/forget_password_cubit.dart';
import '../cubits/forget_password_cubit/forget_password_state.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: (){
          navigateRepacement(context: context, route: Routes.sendCode);
        },),
        title: Text(
          AppStrings.createYourNewPassword.tr(
            context,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ResetPassworddeSucess) {
              //1.show message
              showToast(message: state.message, state: ToastStates.success);
              //2.navigate to login screen
              navigateRepacement(context: context, route: Routes.login);
            }
          },
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<ForgetPasswordCubit>(context)
                  .resetPasswordKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //image
                    Padding(
                      padding: EdgeInsets.only(top: 40.h, bottom: 24.h),
                      child: const CustomImage(imgPath: AppAssets.lock),
                    ),
                    //text
                    Text(
                      AppStrings.createYourNewPassword.tr(context),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //textfield => Password
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .newPasswordController,
                      hint: AppStrings.newPassword.tr(context),
                      isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                          .isNewPasswordShowing,
                      icon: BlocProvider.of<ForgetPasswordCubit>(context)
                          .suffixIconNewPassword,
                      suffixIconOnPressed: () {
                        BlocProvider.of<ForgetPasswordCubit>(context)
                            .changeNewPasswordSuffixIcon();
                      },
                      validate: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //textfield => confirm Password
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .confirmPasswordController,
                      hint: AppStrings.confirmPassword.tr(context),
                      isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                          .isConfirmPasswordShowing,
                      icon: BlocProvider.of<ForgetPasswordCubit>(context)
                          .suffixIconConfirmPassword,
                      suffixIconOnPressed: () {
                        BlocProvider.of<ForgetPasswordCubit>(context)
                            .changeConfrimPasswordSuffixIcon();
                      },
                      validate: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                        if (data !=
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .newPasswordController
                                .text) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
              
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //textfield => Code
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .codeController,
                      hint: AppStrings.code.tr(context),
                      validate: (data) {
                        //12345s =>  null
                        //1234 => 1234
                        if (num.tryParse(data!) == null) {
                          return AppStrings.pleaseEnterValidCode.tr(context);
                        }
                        if (data.isEmpty) {
                          return AppStrings.pleaseEnterValidCode.tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //button
                    state is ResetPasswordLoading
                        ? const CusotmLoadingIndicator()
                        : CustomButton(
                            onPressed: () {
                              if (BlocProvider.of<ForgetPasswordCubit>(context)
                                  .resetPasswordKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<ForgetPasswordCubit>(context)
                                    .resetPassword();
                              }
                            },
                            text: AppStrings.createYourNewPassword.tr(context),
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
