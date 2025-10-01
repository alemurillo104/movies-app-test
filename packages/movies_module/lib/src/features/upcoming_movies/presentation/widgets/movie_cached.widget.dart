import 'package:flutter/material.dart';
import 'package:common_dependency_module/common_dependency_module.dart';

class MovieImageCache extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  const MovieImageCache({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  });

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey.shade800,
      child: const Center(
        child: Icon(
          Icons.broken_image,
          color: Colors.white70,
          size: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      placeholder: (context, url) => Container(
        color: Colors.grey.shade900,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white70,
            strokeWidth: 2,
          ),
        ),
      ),
      errorWidget: (context, url, error) => _buildPlaceholder(),
    );
  }
}
