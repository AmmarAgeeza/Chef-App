import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key, required this.imgUrl, this.fit,
  });
final String imgUrl;
final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
        imageUrl: imgUrl,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
     );
  }
}