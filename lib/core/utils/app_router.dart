import 'package:go_router/go_router.dart';

import '../../Features/home/data/models/book_model/book_model.dart';
import '../../Features/home/presentation/views/book_details_view.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/search/presentation/views/search_view.dart';
import '../../Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeView(),
      ),
      // GoRoute(
      //   path: '/bookDetailsView',
      //   builder: (context, state) => BlocProvider(
      //       create: (context) => RelatedBooksCubit(getIt.get<HomeRepoImpl>()),
      //       child: BookDetailsView(
      //         bookModel: state.extra as BookModel,
      //       )),
      // ),
      GoRoute(
        path: '/bookDetailsView',
        builder: (context, state) => BookDetailsView(
          bookModel: state.extra as BookModel,
        ),
      ),
      GoRoute(
        path: '/searchView',
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
