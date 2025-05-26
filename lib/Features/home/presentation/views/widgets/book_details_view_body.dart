import 'package:BookNest/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'books_details_section.dart';
import 'books_similar_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BookDetailsSection(
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 40,
                  ),
                ),
                SimilarBooksSection(
                  bookModel: bookModel,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
