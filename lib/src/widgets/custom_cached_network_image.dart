// cachedImageNetwork template
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      errorWidget: (context, url, error) {
        return const Center(
          child: Text(
            "لقد حدث مشكل ما",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
      imageUrl: image,
      fit: BoxFit.cover,
      placeholder: (context, url) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
