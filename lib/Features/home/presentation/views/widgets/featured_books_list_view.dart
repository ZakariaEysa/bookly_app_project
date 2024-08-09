import 'package:bookly_app_project/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_project/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_project/Features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import 'books_list_view_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key});

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late ScrollController _scrollController;
  @override
  initState() {
    _scrollController = ScrollController();
    super.initState();
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double threshold = maxScroll * 0.7;

      if (currentScroll >= threshold) {
        BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: 2);
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
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          List<BookEntity> books = state.books;

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
                      GoRouter.of(context)
                          .push('/bookDetailsView', extra: state.books[index]);
                    },
                    child: BooksListViewItem(
                      imageUrl: books[index].image ?? AssetsData.testImage,
                    ),
                  ),
                ),
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(state.error);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
