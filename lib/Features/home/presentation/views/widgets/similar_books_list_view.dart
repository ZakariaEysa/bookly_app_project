import 'package:BookNest/Features/home/presentation/view_model/related_books_cubit/related_books_cubit.dart';
import 'package:BookNest/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/book_entity.dart';
import 'books_list_view_item.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<SimilarBooksListView> createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {
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
          await BlocProvider.of<RelatedBooksCubit>(context).fetchRelatedBooks(
              category: widget.books[0].category, pageNumber: nextPage++);

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
      height: MediaQuery.sizeOf(context).height * .22,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 5.w),
        child: ListView.builder(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(8.0.w),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).pushReplacement('/bookDetailsView',
                    extra: widget.books[index]);
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
