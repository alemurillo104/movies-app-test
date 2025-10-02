part of 'movie_detail_bloc.dart';

enum MovieDetailStatus { initial, loading, success, error }

class MovieDetailState {
  final MovieDetailStatus status;
  final MovieDetailEntity? detail;
  final String? message;

  const MovieDetailState({
    this.status = MovieDetailStatus.initial,
    this.detail,
    this.message,
  });

  MovieDetailState copyWith({
    MovieDetailStatus? status,
    MovieDetailEntity? detail,
    String? message,
  }) {
    return MovieDetailState(
      status: status ?? this.status,
      detail: detail,
      message: message ?? this.message,
    );
  }
}
