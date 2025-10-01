import 'package:flutter/material.dart';
import 'poster_image_cache.widget.dart';
import 'poster_placeholder.widget.dart';

class PosterCardWidget extends StatelessWidget {
  final String imageBaseUrl;
  final String movieTitle;
  final String? moviePosterPath;
  final double movieVoteAverage;
  final Function()? onTap;

  const PosterCardWidget({
    super.key,
    this.imageBaseUrl = 'https://media.themoviedb.org/t/p/w440_and_h660_face/',
    required this.movieTitle,
    this.moviePosterPath,
    required this.movieVoteAverage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        moviePosterPath != null ? '$imageBaseUrl$moviePosterPath' : null;

    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(8.0),
              onTap: onTap,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: imageUrl != null
                      ? PosterImageCacheWidget(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                        )
                      : PosterPlaceholderWidget(
                          movieTitle: movieTitle,
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            movieTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 14),
              const SizedBox(width: 4),
              Text(
                movieVoteAverage.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
