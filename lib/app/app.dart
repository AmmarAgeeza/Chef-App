import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/routes/app_routes.dart';
import '../core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

      designSize:const Size(375,812) ,
      builder:(context,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.intitlRoute,
        onGenerateRoute: AppRoutes.generateRoute,
        title: 'Flutter Demo',
        theme: getAppTheme()
      ), 
      
    );
  }
}
