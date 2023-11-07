import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider((ref) => 'El Padrino');

final searchedMoviesProvider =
    StateNotifierProvider<SearchMoviesNotifer, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);

  return SearchMoviesNotifer(
      searchMovies: movieRepository.searchMovies, ref: ref);
});

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMoviesNotifer extends StateNotifier<List<Movie>> {
  final SearchMovieCallback searchMovies;
  final Ref ref;

  SearchMoviesNotifer({required this.searchMovies, required this.ref})
      : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final movies = await searchMovies(query);

    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;

    return movies;
  }
}
