import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Features/home/data/repos/home_repo_impl.dart';
import 'Features/home/domain/entities/book_entity.dart';
import 'Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'Features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'Features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() async {
  setupServiceLocator();
  await Hive.initFlutter();

  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBooks);
  await Hive.openBox<BookEntity>(kNewestBooks);
  await Hive.openBox<BookEntity>(kRelatedBooks);

  Bloc.observer = SimpleBlocObserver();

  runApp(const BookNest());
}

class BookNest extends StatelessWidget {
  const BookNest({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()))
            ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
              FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()))
            ..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
