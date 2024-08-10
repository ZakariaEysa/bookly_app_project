import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/home/presentation/view_model/related_books_cubit/related_books_cubit.dart';
import '../../Features/home/presentation/views/book_details_view.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/search/presentation/views/search_view.dart';
import 'service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/data/models/book_model/book_model.dart';
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
