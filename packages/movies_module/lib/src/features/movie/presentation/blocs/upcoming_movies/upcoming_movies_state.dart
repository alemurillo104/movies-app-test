part of 'upcoming_movies_bloc.dart';

enum UpcomingMoviesStatus {
  initial,
  loading,
  success,
  error,
}

class UpcomingMoviesState extends Equatable {
  final UpcomingMoviesStatus status;
  final List<UpcomingMovieEntity> movies;
  final String? message;

  const UpcomingMoviesState({
    this.status = UpcomingMoviesStatus.initial,
    this.movies = const [],
    this.message = '',
  });

  UpcomingMoviesState copyWith({
    UpcomingMoviesStatus? status,
    List<UpcomingMovieEntity>? movies,
    String? message,
  }) {
    return UpcomingMoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, movies, message];
}
