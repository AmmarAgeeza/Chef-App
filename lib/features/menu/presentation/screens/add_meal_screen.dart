import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/widgets/cusotm_lodaing_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_file_image.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../components/image_picker_dialog.dart';
import '../cubit/menu_cubit.dart';
import '../cubit/menu_state.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.addDishToMenu.tr(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Center(
            child: BlocConsumer<MenuCubit, MenuState>(
              listener: (context, state) {
                if (state is AddDishSucessState) {
                  showToast(
                      message: AppStrings.mealAddedSucessfully,
                      state: ToastStates.success);
                  Navigator.pop(context);
                  BlocProvider.of<MenuCubit>(context).getAllMeals();
                }
              },
              builder: (context, state) {
                final menuCubit = BlocProvider.of<MenuCubit>(context);

                return Form(
                  key: menuCubit.addToMenuKey,
                  child: Column(
                    children: [
                      //add photo of meal
                      Stack(
                        children: [
                          //image
                          CustomFileImage(
                            image: menuCubit.image,
                            
                          ),
                          //add icon button
                          Positioned.directional(
                              textDirection: Directionality.of(context),
                              bottom: -8,
                              end: -8,
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ImagePickerDilog(
                                          cameraOnTap: () {
                                            Navigator.pop(context);
                                            pickImage(ImageSource.camera).then(
                                                (value) =>
                                                    menuCubit.takeImage(value));
                                          },
                                          gallreyOnTap: () {
                                            Navigator.pop(context);

                                            pickImage(ImageSource.gallery).then(
                                                (value) =>
                                                   menuCubit.takeImage(value));
                                          },
                                        );
                                      });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 35,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(height: 16.h),
                      //name text field
                      CustomTextFormField(
                        controller: menuCubit.mealNameController,
                        hint: AppStrings.mealName.tr(context),
                        validate: (data) {
                          if (data!.isEmpty) {
                            return AppStrings.pleaseEnterValidMealName
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      //price text field
                      CustomTextFormField(
                        controller: menuCubit.mealPriceController,
                        hint: AppStrings.mealPrice.tr(context),
                        validate: (data) {
                          if (num.tryParse(data!) == null) {
                            return AppStrings.pleaseEnterValidMealPrice
                                .tr(context);
                          }
                          if (data.isEmpty) {
                            return AppStrings.pleaseEnterValidMealPrice
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      //desc text field
                      CustomTextFormField(
                        controller: menuCubit.mealDescController,
                        hint: AppStrings.mealDesc.tr(context),
                        validate: (data) {
                          if (data!.isEmpty) {
                            return AppStrings.pleaseEnterValidMealDesc
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      //category drop menu item
                      SizedBox(
                        height: 48.h,
                        width: double.infinity,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Text(AppStrings.category.tr(context)),
                          value: menuCubit.selectedItem,
                          items: menuCubit.categoyList
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (data) {
                            menuCubit.changeItem(data);
                          },
                        ),
                      ),
                      //quantity or number
                      Row(
                        children: [
                          //quantity
                          Row(
                            children: [
                              Radio(
                                  activeColor: AppColors.primary,
                                  groupValue: menuCubit.groupVal,
                                  value: 'quantity',
                                  onChanged: (val) {
                                    menuCubit.changeGroupVal(val);
                                  }),
                              Text(AppStrings.mealQuantity.tr(context))
                            ],
                          ),
                          const Spacer(),
                          //number
                          Row(
                            children: [
                              Radio(
                                  activeColor: AppColors.primary,
                                  groupValue: menuCubit.groupVal,
                                  value: 'number',
                                  onChanged: (val) {
                                    menuCubit.changeGroupVal(val);
                                  }),
                              Text(AppStrings.mealNumber.tr(context))
                            ],
                          ),
                        ],
                      ),
                      //add to menu button
                      SizedBox(height: 16.h),
                      state is AddDishLoadingState
                          ? const CusotmLoadingIndicator()
                          : CustomButton(
                              onPressed: () {
                                if (menuCubit.addToMenuKey.currentState!
                                    .validate()) {
                                  menuCubit.addDishToMenu();
                                }
                              },
                              text: AppStrings.addToMenu.tr(context),
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
