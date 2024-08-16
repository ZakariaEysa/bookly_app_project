import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../../../../core/utils/functions/build_error_snack_bar.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../domain/entities/book_entity.dart';
import '../../view_model/newest_books_cubit/newest_books_cubit.dart';
import 'best_seller_list_view.dart';
import 'newest_books_list_view_loading_indicator.dart';

class BestSellerListViewBlocConsumer extends StatefulWidget {
  const BestSellerListViewBlocConsumer({super.key});

  @override
  State<BestSellerListViewBlocConsumer> createState() =>
      _BestSellerListViewBlocConsumerState();
}

class _BestSellerListViewBlocConsumerState
    extends State<BestSellerListViewBlocConsumer> {
  List<BookEntity> books = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }

        if (state is NewestBooksPaginationFailure) {
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
                BlocProvider.of<NewestBooksCubit>(context)
                    .fetchNewestBooks(pageNumber: count);
                count++;
              }

              return _buildStateWidget(state);
            } else {
              return const NewestBooksListViewLoadingIndicator();
            }
          },
          child: const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildStateWidget(NewestBooksState state) {
    if (state is NewestBooksSuccess ||
        state is NewestBooksPaginationLoading ||
        state is NewestBooksPaginationFailure && books.isNotEmpty) {
      return BestSellerListView(
        books: books,
      );
    } else if (state is NewestBooksFailure) {
      return CustomErrorWidget(state.error);
    } else {
      return const NewestBooksListViewLoadingIndicator();
    }
  }
}
