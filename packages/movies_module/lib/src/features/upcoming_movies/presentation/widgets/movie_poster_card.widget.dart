import 'package:flutter/material.dart';
import 'movie_cached.widget.dart';
import 'movie_placeholder.widget.dart';
import '../../domain/entities/upcoming_movie.entity.dart';

class MoviePosterCard extends StatelessWidget {
  final UpcomingMovieEntity movie;

  const MoviePosterCard({
    super.key,
    required this.movie,
  });

  //TODO: Mover logica al bloc
  static const String _imageBaseUrl =
      'https://media.themoviedb.org/t/p/w440_and_h660_face/';

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        movie.posterPath != null ? '$_imageBaseUrl${movie.posterPath}' : null;

    return InkWell(
      onTap: () {},
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: imageUrl != null
                      ? MovieImageCache(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                        )
                      : MoviePlaceholderWidget(
                          movie: movie,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.title,
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
                  movie.voteAverage.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
