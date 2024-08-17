import 'package:bookly_app_project/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app_project/Features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../../../../core/utils/functions/build_error_snack_bar.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../home/domain/entities/book_entity.dart';
import '../../../../home/presentation/views/widgets/newest_books_list_view_loading_indicator.dart';

class SearchedListBlocConsumer extends StatefulWidget {
  const SearchedListBlocConsumer({super.key});

//SearchResultListView
  @override
  State<SearchedListBlocConsumer> createState() =>
      _SearchedListBlocConsumerState();
}

class _SearchedListBlocConsumerState extends State<SearchedListBlocConsumer> {
  List<BookEntity> books = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(builder: (context, state) {
      return OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          connectivity,
          Widget child,
        ) {
          final bool connected = connectivity[0] == ConnectivityResult.wifi;

          if (connected || books.isNotEmpty) {
            if (books.isEmpty && count == 0) {
              BlocProvider.of<SearchCubit>(context).fetchSearchedBooks(
                  userQuery: books[0].category, pageNumber: count);
              count++;
            }

            return _buildStateWidget(state);
          } else {
            return const NewestBooksListViewLoadingIndicator();
          }
        },
        child: const SizedBox.shrink(),
      );
    }, listener: (context, state) {
      if (state is SearchBooksSuccess) {
        books.addAll(state.books);
      }
      if ((state is SearchBooksPaginationFailure)) {
        ScaffoldMessenger.of(context).showSnackBar(
          buildErrorSnackBar(state.errorMessage),
        );
      }
    });
  }

  Widget _buildStateWidget(SearchState state) {
    if (state is SearchBooksSuccess ||
        state is SearchBooksPaginationLoading ||
        state is SearchBooksPaginationFailure && books.isNotEmpty) {
      return BestSellerListView(books: books);
    } else if (state is SearchBooksFailure) {
      return CustomErrorWidget(state.error);
    } else {
      return const NewestBooksListViewLoadingIndicator();
    }
  }
}
