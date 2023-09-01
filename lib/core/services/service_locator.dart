import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/auth/data/repository/auth_repository.dart';
import 'package:chef_app/features/home/home_cubit/home_cubit.dart';
import 'package:chef_app/features/menu/data/repository/menu_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/menu/presentation/cubit/menu_cubit.dart';

final sl = GetIt.instance;
void initServiceLoactor(){
  //cubits
sl.registerLazySingleton(()=> GlobalCubit());  
sl.registerLazySingleton(()=> LoginCubit(sl()));  
sl.registerLazySingleton(()=> ForgetPasswordCubit(sl()));  
sl.registerLazySingleton(()=> HomeCubit());  
sl.registerLazySingleton(()=> MenuCubit(sl()));  

//auth feature 
sl.registerLazySingleton(() => AuthRepository());
sl.registerLazySingleton(() => MenuRepository());
//external
  sl.registerLazySingleton(()=> CacheHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());

}