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
            Text(model.name),
            Text(model.description),
            Text(model.price.toString()),
          ],
        ),

        const Spacer(),
        BlocBuilder<MenuCubit, MenuState>(
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
        ),
      ],
    );
  }
}
