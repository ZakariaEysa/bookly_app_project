import 'package:bookly_app_project/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/build_error_snack_bar.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../domain/entities/book_entity.dart';
import '../../view_model/related_books_cubit/related_books_cubit.dart';
import 'featured_books_list_view_loading_indicator.dart';

class SimilarBooksListViewBlocConsumer extends StatefulWidget {
  const SimilarBooksListViewBlocConsumer({super.key});

  @override
  State<SimilarBooksListViewBlocConsumer> createState() =>
      _SimilarBooksListViewBlocConsumerState();
}

class _SimilarBooksListViewBlocConsumerState
    extends State<SimilarBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RelatedBooksCubit, RelatedBooksState>(
        builder: (context, state) {
      if (state is RelatedBooksSuccess ||
          state is RelatedBooksPaginationLoading ||
          state is RelatedBooksPaginationFailure) {
        return SimilarBooksListView(books: books);
      } else if (state is RelatedBooksLoading) {
        return const FeaturedBooksListViewLoadingIndicator();
      } else if (state is RelatedBooksFailure) {
        return CustomErrorWidget(state.message);
      } else {
        return const CustomLoadingIndicator();
      }
    }, listener: (context, state) {
      if (state is RelatedBooksSuccess) {
        books.addAll(state.books);
      }
      if ((state is RelatedBooksPaginationFailure)) {
        ScaffoldMessenger.of(context).showSnackBar(
          buildErrorSnackBar(state.errorMessage),
        );
      }
    });
  }
}
