import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedBookImage extends StatelessWidget {
  const CachedBookImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.8 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          placeholder:
              (context, url) => const Center(child: CustomLoadingIndicator()),
          errorWidget:
              (context, url, error) => const Icon(Icons.error, size: 64),
        ),
      ),
    );
  }
}
