import 'package:bookly_app_project/Features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/domain/entities/book_entity.dart';
import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
  late ScrollController _scrollController;
  var nextPage = 1;
  bool isLoading = false;

  @override
  initState() {
    _scrollController = ScrollController();
    super.initState();
    _scrollController.addListener(() async {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double threshold = maxScroll * 0.7;

      if (currentScroll >= threshold) {
        if (!isLoading) {
          isLoading = true;
          await BlocProvider.of<SearchCubit>(context).fetchSearchedBooks(
              userQuery: widget.books[0].category, pageNumber: nextPage++);

          isLoading = false;
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.zero,
          itemCount: widget.books.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
              child: BookListViewItem(
                bookModel: widget.books[index],
              ),
            );
          }),
    );
  }
}
