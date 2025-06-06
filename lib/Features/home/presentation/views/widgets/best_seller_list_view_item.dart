import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../domain/entities/book_entity.dart';
import 'book_rating.dart';
import 'books_list_view_item.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});

  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (bookModel.image != null) {
          GoRouter.of(context).push('/bookDetailsView', extra: bookModel);
        }
      },
      child: SizedBox(
        height: 125.h,
        child: Row(
          children: [
            BooksListViewItem(
                imageUrl: bookModel.image ?? AssetsData.testImage),
            SizedBox(
              width: 30.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .5,
                    child: Text(
                      bookModel.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    bookModel.authorName ?? 'Unknown',
                    style: Styles.textStyle14,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const BookRating(
                        count: 3,
                        rating: "3.5",
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
