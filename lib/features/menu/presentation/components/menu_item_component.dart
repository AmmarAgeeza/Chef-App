import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/features/menu/data/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';
import '../cubit/menu_cubit.dart';
import '../cubit/menu_state.dart';

class MenuItemComponent extends StatelessWidget {
  const MenuItemComponent({
    super.key,
    required this.model,
  });
  final MealModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //image
        SizedBox(
          height: 60.h,
          width: 60.w,
          child: CustomCachedNetworkImage(imgUrl: model.images[0]),
        ),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(model.name),
             CustomTextMealComponent(text: model.name),
             CustomTextMealComponent(text: model.description),
            // SizedBox(
            //   width: 180.w,
            //   child: Text(
            //     model.description,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),
            // Container(
            //   constraints: BoxConstraints(maxWidth: 180.w),
            //   child: Text(
            //     model.description,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),
            Text(model.price.toString() + AppStrings.le.tr(context)),
          ],
        ),

        const Spacer(),
        BlocConsumer<MenuCubit, MenuState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDialog(
                        message: AppStrings.deleteMeal.tr(context),
                        confirmAction: () {
                          BlocProvider.of<MenuCubit>(context)
                              .deleteDish(model.id);
                          Navigator.pop(context);
                        },
                      );
                    });
              },
              icon: const Icon(
                Icons.cancel,
                color: AppColors.red,
                size: 40,
              ),
            );
          },
          listener: (BuildContext context, MenuState state) {
            if (state is DeleteDishSucessState) {
              BlocProvider.of<MenuCubit>(context).getAllMeals();
            }
          },
        ),
      ],
    );
  }
}

class CustomTextMealComponent extends StatelessWidget {
  const CustomTextMealComponent({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
     constraints: BoxConstraints(maxWidth: 180.w),
     child: Text(
       text,
       overflow: TextOverflow.ellipsis,
     ),
            );
  }
}
//1.naviagtor.pop
//2.show CusotmLoadingIndicator