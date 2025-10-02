part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent {
  const MovieDetailEvent();
}

class FetchMovieDetail extends MovieDetailEvent {
  final int movieId;

  const FetchMovieDetail(this.movieId);

  @override
  List<Object> get props => [movieId];
}
