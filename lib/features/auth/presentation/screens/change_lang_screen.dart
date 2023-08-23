import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            //background image
            const CustomImage(
              imgPath: AppAssets.background,
              w: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(
                    height: 116.h,
                  ),
                  CustomImage(
                    imgPath: AppAssets.appLogo,
                    h: 120.h,
                    w: 120.w,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Welcome to Chef App',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: 54.h,
                  ),
                  Text(
                    'Please choose your language',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  Row(
                    children: [
                      CustomButton(
                        text: 'English',
                        onPressed: () {},
                        width: 140,
                        background: AppColors.black,
                      ),
                      const Spacer(),
                      CustomButton(
                        text: 'العربية',
                        onPressed: () {},
                        width: 140,
                        background: AppColors.black,
                      ),
                    ],
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

