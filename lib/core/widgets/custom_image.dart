import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imgPath,
    this.h,
    this.w,
    this.fit = BoxFit.fill,
  });
  final String imgPath;
  final double? h;
  final double? w;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgPath,
      width: w,
      height: h,
      fit: fit,
    );
  }
}
