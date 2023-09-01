import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';

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
          child: const CustomCachedNetworkImage(
            imgUrl:
                'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?cs=srgb&dl=pexels-ella-olsson-1640772.jpg&fm=jpg',
          ),
          
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
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertDialog(
                    message: 'حذف الوجبة',
                    confirmAction: () {},
                  );
                });
          },
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
