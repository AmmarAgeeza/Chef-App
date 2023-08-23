import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 120.h,
                width: 120.w,
                child: Image.asset(AppAssets.appLogo)),
            SizedBox(
              height: 16.h,
            ),
            Text('Chef App', style: Theme.of(context).textTheme.displayLarge),
          ],
        ),
      ),
    );
  }
}
