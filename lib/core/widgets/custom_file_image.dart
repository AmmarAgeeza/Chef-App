import 'dart:io';

import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_assets.dart';

class CustomFileImage extends StatelessWidget {
  const CustomFileImage({super.key, this.image, });
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
          radius: 75.w,
          backgroundImage:  FileImage(
              File(image!.path),
              
            ),
        )
        : const CustomImage(imgPath: AppAssets.imagePicker);
  }
}
