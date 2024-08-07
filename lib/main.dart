import 'package:bookly_app_project/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_project/Features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app_project/Features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';

//
void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
            ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks(),
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
