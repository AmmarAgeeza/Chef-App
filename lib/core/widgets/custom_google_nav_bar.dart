import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../core/utils/app_colors.dart';

class CustomGNavWidget extends StatelessWidget {
  const CustomGNavWidget({
    super.key,
    required this.currentIndex,
    this.onChenged,
    required this.tabs,
  });
  final int currentIndex;
  final Function(int)? onChenged;
  final List<GButton> tabs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      child: GNav(
        activeColor: AppColors.primary,
        selectedIndex: currentIndex,
        onTabChange: onChenged,
        tabBackgroundColor: AppColors.black12,
        padding: const EdgeInsets.all(16),
        tabBorderRadius: 16,
        gap: 8,
        tabs: tabs,
      ),
    );
  }
}
