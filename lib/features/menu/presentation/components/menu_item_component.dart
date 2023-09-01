import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class MenuItemComponent extends StatelessWidget {
  const MenuItemComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //image
        SizedBox(
          height: 60.h,
          width: 60.w,
          child: Image.network(''),
        ),
        SizedBox(
          width: 8.w,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title'),
            Text('Subtitle'),
            Text('Price LE'),
          ],
        ),

        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.cancel,
            color: AppColors.red,
            size: 40,
          ),
        ),
      ],
    );
  }
}
