import 'package:chef_app/features/menu/presentation/screens/menu_home.dart';
import 'package:chef_app/features/profile/presentation/screens/profile_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Widget> screens = [
    const MenuHomeScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;
  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }
}
