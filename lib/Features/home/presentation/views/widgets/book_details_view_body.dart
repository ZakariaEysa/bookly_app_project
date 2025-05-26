import 'package:BookNest/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'books_details_section.dart';
import 'books_similar_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
                Expanded(
                  child: SizedBox(
                    height: 40.h,
                  ),
                ),
                SimilarBooksSection(
                  bookModel: bookModel,
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
