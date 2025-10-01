import 'upcoming_movie.entity.dart';

class UpcomingMoviesEntity {
  final String maximumDate;
  final String minimumDate;
  final List<UpcomingMovieEntity> movies;

  UpcomingMoviesEntity({
    required this.maximumDate,
    required this.minimumDate,
    required this.movies,
  });
}
