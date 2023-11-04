import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieMapNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorRepository = ref.watch(actorRepositoryProvider);

  return ActorsByMovieMapNotifier(getActors: actorRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieMapNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovieMapNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
