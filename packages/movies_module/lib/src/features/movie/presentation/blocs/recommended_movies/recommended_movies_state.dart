part of 'recommended_movies_bloc.dart';

enum RecommendedMoviesStatus { loading, success, error, empty }

class RecommendedMoviesState extends Equatable {
  final RecommendedMoviesStatus status;
  final List<TrendingMovieEntity> movies;
  final String? message;

  const RecommendedMoviesState({
    this.status = RecommendedMoviesStatus.loading,
    this.movies = const [],
    this.message,
  });

  RecommendedMoviesState copyWith({
    RecommendedMoviesStatus? status,
    List<TrendingMovieEntity>? movies,
    String? message,
  }) {
    return RecommendedMoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, movies, message];
}
