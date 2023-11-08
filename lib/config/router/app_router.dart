import 'package:go_router/go_router.dart';
import 'package:cinemapedia/presentation/screens/screen.dart';
import 'package:cinemapedia/presentation/widgets/views/views.dart';

final appRouter = GoRouter(
  routes: [
    ShellRoute(
        builder: (context, state, child) {
          return HomeScreen(childView: child);
        },
        routes: [
          GoRoute(
              path: '/',
              builder: (context, state) {
                return const HomeView();
              },
              routes: [
                GoRoute(
                  path: 'movie/:id',
                  name: MovieScreen.name,
                  builder: (context, state) {
                    final movieId = state.pathParameters['id'] ?? 'no-id';

                    return MovieScreen(movieId: movieId);
                  },
                )
              ]),
          GoRoute(
              path: '/favorites',
              builder: (context, state) {
                return const FavoritesView();
              }),
        ]
        // ),
        // GoRoute(
        //   path: '/',
        //   name: HomeScreen.name,
        //   builder: (context, state) => const HomeScreen(
        //     childView: HomeView(),
        //   ),
        // ),
        // GoRoute(
        //   path: '/movie/:id',
        //   name: MovieScreen.name,
        //   builder: (context, state) {
        //     final movieId = state.pathParameters['id'] ?? 'no-id';

        //     return MovieScreen(movieId: movieId);
        //   },
        )
  ],
);
