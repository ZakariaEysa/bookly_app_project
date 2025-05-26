import 'package:BookNest/Features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:BookNest/Features/search/presentation/views/widgets/search_result_list_view.dart';
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

bool matchQuery() {
  return _SearchedListBlocConsumerState.currentQuery.toString().toLowerCase() ==
      _SearchedListBlocConsumerState.previousQuery.toLowerCase().toLowerCase();
}

void setQuery(String current) {
  _SearchedListBlocConsumerState.previousQuery =
      _SearchedListBlocConsumerState.currentQuery;
  _SearchedListBlocConsumerState.currentQuery = current;

  if (_SearchedListBlocConsumerState.previousQuery == '') {
    _SearchedListBlocConsumerState.previousQuery = current;
  }
}

class _SearchedListBlocConsumerState extends State<SearchedListBlocConsumer> {
  List<BookEntity> books = [];
  int count = 0;

  static String currentQuery = '';
  static String previousQuery = '';

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
            return _buildStateWidget(state);
          } else {
            return const NewestBooksListViewLoadingIndicator();
          }
        },
        child: const SizedBox.shrink(),
      );
    }, listener: (context, state) {
      if (state is SearchBooksSuccess) {
        if (state.books.isNotEmpty) {
          if (matchQuery()) {
          } else {
            books.clear();
            previousQuery = currentQuery;
            resetController();
          }
        }
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
      return SearchResultListView(books: books);
    } else if (state is SearchBooksFailure) {
      return CustomErrorWidget(state.error);
    } else {
      return const NewestBooksListViewLoadingIndicator();
    }
  }
}
