import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/cubits/cubit/login_cubit.dart';

final sl = GetIt.instance;
void initServiceLoactor(){
  //cubits
sl.registerLazySingleton(()=> GlobalCubit());  
sl.registerLazySingleton(()=> LoginCubit());  
//external
  sl.registerLazySingleton(()=> CacheHelper());

}