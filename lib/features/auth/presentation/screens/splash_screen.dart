import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    natvigateAfterThreeSeconds();
    super.initState();
  }

  void natvigateAfterThreeSeconds() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      await sl<CacheHelper>().getData(
                key: ApiKeys.token,
              ) ==
              null
          ? navigate(context: context, route: Routes.changeLang)
          : navigate(context: context, route: Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              imgPath: AppAssets.appLogo,
              h: 120.h,
              w: 120.w,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(AppStrings.chefApp.tr(context),
                style: Theme.of(context).textTheme.displayLarge),
          ],
        ),
      ),
    );
  }
}
