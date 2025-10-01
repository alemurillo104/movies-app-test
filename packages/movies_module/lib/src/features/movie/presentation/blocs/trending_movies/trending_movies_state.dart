part of 'trending_movies_bloc.dart';

enum TrendingMoviesStatus { initial, loading, success, error }

class TrendingMoviesState extends Equatable {
  final TrendingMoviesStatus status;
  final List<TrendingMovieEntity> movies;
  final String message;

  const TrendingMoviesState({
    this.status = TrendingMoviesStatus.initial,
    this.movies = const [],
    this.message = '',
  });

  TrendingMoviesState copyWith({
    TrendingMoviesStatus? status,
    List<TrendingMovieEntity>? movies,
    String? message,
  }) {
    return TrendingMoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, movies, message];
}
