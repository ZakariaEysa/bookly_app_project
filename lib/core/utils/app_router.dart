import 'package:bookly_app_project/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_project/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_project/Features/home/domain/use_cases/fetch_related_books_use_case.dart';
import 'package:bookly_app_project/Features/home/presentation/view_model/related_books_cubit/related_books_cubit.dart';
import 'package:bookly_app_project/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app_project/Features/search/domain/use_cases/fetch_searched_books_use_case.dart';
import 'package:bookly_app_project/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/presentation/views/book_details_view.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/search/presentation/view_models/search_cubit/search_cubit.dart';
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
      GoRoute(
        path: '/bookDetailsView',
        builder: (context, state) => BlocProvider(
            create: (context) => RelatedBooksCubit(
                FetchRelatedBooksUseCase(getIt.get<HomeRepoImpl>()))
              ..fetchRelatedBooksUseCase
                  .call(0, (state.extra as BookEntity).category),
            child: BookDetailsView(
              bookModel: state.extra as BookEntity,
            )),
      ),
      GoRoute(
        path: '/searchView',
        builder: (context, state) => BlocProvider(
            create: (context) => SearchCubit(
                FetchSearchedBooksUseCase(getIt.get<SearchRepoImpl>()))
              ..fetchSearchedBooksUseCase.call(0, "art"),
            child: SearchView()),
      ),
    ],
  );
}
