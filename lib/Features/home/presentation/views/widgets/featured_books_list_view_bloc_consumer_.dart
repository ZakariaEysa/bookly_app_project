import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/build_error_snack_bar.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../domain/entities/book_entity.dart';
import '../../view_model/featured_books_cubit/featured_books_cubit.dart';
import 'featured_books_list_view.dart';
import 'featured_books_list_view_loading_indicator.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({super.key});

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if ((state is FeaturedBooksSuccess)) {
          books.addAll(state.books);
        }

        if ((state is FeaturedBooksPaginationFailure)) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackBar(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure && books.isNotEmpty) {
          return FeaturedBooksListView(books: books);
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(state.error);
        } else {
          return const FeaturedBooksListViewLoadingIndicator();
        }
      },
    );
  }
}
