import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:common_dependency_module/common_dependency_module.dart';
import 'package:movies_module/src/navigation/modular.dart';
import '../widgets/poster_card_movie.widget.dart';
import '../blocs/movie_detail/movie_detail_bloc.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  const MovieDetailPage({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _movieDetailBloc = MoviesModularModule.injectorBloc<MovieDetailBloc>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return BlocProvider(
      create: (context) => _movieDetailBloc
        ..add(
          FetchMovieDetail(
            widget.movieId,
          ),
        ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            switch (state.status) {
              case MovieDetailStatus.success:
                return PosterCardMovie(
                  posterUrl:
                      'https://image.tmdb.org/t/p/w500/${state.detail!.posterPath}',
                  title: state.detail!.title,
                  description: state.detail!.overview,
                  releaseYear:
                      DateTime.tryParse(state.detail!.releaseDate)?.year ??
                          2025,
                  language: 'es',
                  rating: state.detail!.voteAverage,
                  genres:
                      state.detail!.genres.map((genre) => genre.name).toList(),
                );
              case MovieDetailStatus.error:
                return const Text('ocurrio un error');
              case MovieDetailStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
