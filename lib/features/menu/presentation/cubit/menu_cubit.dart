import 'package:chef_app/features/menu/data/repository/menu_repository.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepository) : super(MenuInitial());
  final MenuRepository menuRepository; 
  XFile? image;
  TextEditingController mealNameController = TextEditingController();
  TextEditingController mealPriceController = TextEditingController();
  TextEditingController mealDescController = TextEditingController();
  GlobalKey<FormState> addToMenuKey = GlobalKey<FormState>();
   List<String> categoyList = [
    'Beef',
    'Chicken',
    'Fish',
    'Seafood',
    'Pork',
    'Lamb',
    'Vegetarian',
    'Vegan',
    'Gluten-free',
  ];
  String selectedItem='Beef';
  void changeItem(item){
    selectedItem=item;
    emit(ChangeItemState());
  }
  String groupVal='quantity';
  void changeGroupVal(val){
    groupVal=val;
    emit(ChangeGroupState());
  }
}
