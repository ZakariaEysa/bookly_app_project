import 'package:bookly_app_project/Features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({
    required this.books,
    super.key,
  });

  final List<BookEntity> books;

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  late ScrollController _scrollController;
  var nextPage = 1;
  bool isLoading = false;

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
          await BlocProvider.of<NewestBooksCubit>(context)
              .fetchNewestBooks(pageNumber: nextPage++);
          isLoading = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        itemCount: widget.books.length,
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
            child: BookListViewItem(
              bookModel: widget.books[index],
            ),
          );
        });
  }
}
