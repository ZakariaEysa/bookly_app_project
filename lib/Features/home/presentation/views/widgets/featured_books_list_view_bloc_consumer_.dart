import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

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
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }

        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackBar(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        return OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            connectivity,
            Widget child,
          ) {
            final bool connected = connectivity[0] == ConnectivityResult.wifi;

            if (connected || books.isNotEmpty) {
              if (books.isEmpty && count == 0) {
                BlocProvider.of<FeaturedBooksCubit>(context)
                    .fetchFeaturedBooks(pageNumber: count);
                count++;
              }

              return _buildStateWidget(state);
            } else {
              return const FeaturedBooksListViewLoadingIndicator();
            }
          },
          child: SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildStateWidget(FeaturedBooksState state) {
    if (state is FeaturedBooksSuccess ||
        state is FeaturedBooksPaginationLoading ||
        (state is FeaturedBooksPaginationFailure && books.isNotEmpty)) {
      return FeaturedBooksListView(books: books);
    } else if (state is FeaturedBooksFailure) {
      return CustomErrorWidget(state.error);
    } else {
      return const FeaturedBooksListViewLoadingIndicator();
    }
  }
}
