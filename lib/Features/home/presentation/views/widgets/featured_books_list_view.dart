import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../domain/entities/book_entity.dart';
import '../../view_model/featured_books_cubit/featured_books_cubit.dart';
import 'books_list_view_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
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
          await BlocProvider.of<FeaturedBooksCubit>(context)
              .fetchFeaturedBooks(pageNumber: nextPage++);
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
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .3,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 18),
        child: ListView.builder(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: GestureDetector(
              onTap: () {
                if (widget.books[index].image != null) {
                  GoRouter.of(context)
                      .push('/bookDetailsView', extra: widget.books[index]);
                }
              },
              child: BooksListViewItem(
                imageUrl: widget.books[index].image ?? AssetsData.testImage,
              ),
            ),
          ),
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
        ),
      ),
    );
  }
}
