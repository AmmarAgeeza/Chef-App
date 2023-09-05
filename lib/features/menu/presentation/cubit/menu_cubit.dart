import 'package:chef_app/features/menu/data/repository/menu_repository.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/meal_model.dart';

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
  String selectedItem = 'Beef';
  void changeItem(item) {
    selectedItem = item;
    emit(ChangeItemState());
  }

  String groupVal = 'quantity';
  void changeGroupVal(val) {
    groupVal = val;
    emit(ChangeGroupState());
  }

  void addDishToMenu() async {
    emit(AddDishLoadingState());
    final res = await menuRepository.addDishToMenu(
      image: image!,
      mealName: mealNameController.text,
      mealDesc: mealDescController.text,
      mealCategory: selectedItem,
      howToSell: groupVal,
      mealPrice: double.parse(mealPriceController.text),
    );
    res.fold((l) => emit(AddDishErrorState()), (r) => emit(AddDishSucessState()));
  }

  void deleteDish(id) async {
    emit(DeleteDishLoadingState());
    final res = await menuRepository.deleteMeal(id: id);
    res.fold(
        (l) => emit(DeleteDishErrorState()), (r) => emit(DeleteDishSucessState()));
  }
List<MealModel> meals=[];
  void getAllMeals() async {
    emit(GetAllChefMealsLoadingState());
    final res = await menuRepository.getMeals();
    res.fold((l) => emit(GetAllChefMealsErrorState()),
        (r) {
          meals=r.meals;
          emit (GetAllChefMealsSucessState());
        });
  }
  //take image from user
  void takeImage(value){
    image=value;
    emit(TakeImageFromUser());
  }
}
