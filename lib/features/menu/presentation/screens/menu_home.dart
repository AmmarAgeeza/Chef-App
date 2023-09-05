import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/cusotm_lodaing_indicator.dart';
import '../../../../core/widgets/custom_button.dart';
import '../components/menu_item_component.dart';
import '../cubit/menu_cubit.dart';
import '../cubit/menu_state.dart';

class MenuHomeScreen extends StatelessWidget {
  const MenuHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // add dish to menu button
              CustomButton(
                onPressed: () {
                  navigate(context: context, route: Routes.addMeal);
                },
                text: AppStrings.addDishToMenu.tr(context),
              ),
              //items
              BlocBuilder<MenuCubit, MenuState>(
                builder: (context, state) {
                  final menuCubit = BlocProvider.of<MenuCubit>(context);

                  return Expanded(
                    child: state is GetAllChefMealsLoadingState? const CusotmLoadingIndicator():menuCubit.meals.isEmpty
                        ?  Center(child: Text(AppStrings.noMeals.tr(context)))
                        : ListView.builder(
                            itemCount: menuCubit.meals.length,
                            itemBuilder: (context, index) =>  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MenuItemComponent( model: menuCubit.meals[index]),
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
