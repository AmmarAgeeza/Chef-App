import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //header that contains image and welcome back text
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const CustomImage(
                  imgPath: AppAssets.backgroundTwo,
                  w: double.infinity,
                ),
                Center(
                    child: Text(
                  AppStrings.welcomeBack.tr(context),
                  style: Theme.of(context).textTheme.displayLarge,
                )),
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: TextEditingController(),
                    hint: 'E-mail'.tr(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
