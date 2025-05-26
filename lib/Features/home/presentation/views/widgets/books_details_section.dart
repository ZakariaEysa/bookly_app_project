import 'package:BookNest/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'books_list_view_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .2),
              child: BooksListViewItem(
                imageUrl: bookModel.image ?? AssetsData.testImage,
              ),
            ),
            Positioned(
                right: 20,
                bottom: -10,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      size: 40.sp,
                      Icons.favorite,
                      color: Colors.red,
                    ))),
          ],
        ),
        SizedBox(
          height: 43.h,
        ),
        Text(
          textAlign: TextAlign.center,
          bookModel.title,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          maxLines: 1,
        ),
        SizedBox(
          height: 6.h,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.authorName ?? 'No Author',
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        const BookRating(
          count: 0,
          alignment: MainAxisAlignment.center,
          rating: '3.8',
        ),
        SizedBox(
          height: 37.h,
        ),
        BooksAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
