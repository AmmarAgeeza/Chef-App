import 'package:chef_app/core/locale/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../home_cubit/home_cubit.dart';

class GNavComponent extends StatelessWidget {
  const GNavComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      activeColor: AppColors.primary,
      selectedIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
      onTabChange: (value) {
        BlocProvider.of<HomeCubit>(context).changeIndex(value);
      },
      tabBackgroundColor: AppColors.black12,
      padding: const EdgeInsets.all(16),
      tabBorderRadius: 16,
      gap: 8,
      tabs: [
        const GButton(icon: Icons.menu, text: 'Menu'),
        GButton(icon: Icons.person, text: AppStrings.editProfile.tr(context)),
      ],
    );
  }
}
