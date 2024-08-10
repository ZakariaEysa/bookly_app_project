import 'package:bookly_app_project/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/cupertino.dart';

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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: BooksListViewItem(
            imageUrl: bookModel.image ?? AssetsData.testImage,
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          textAlign: TextAlign.center,
          bookModel.title,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          maxLines: 1,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.authorName ?? 'No Author',
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          count: 0,
          alignment: MainAxisAlignment.center,
          rating: '3.8',
        ),
        const SizedBox(
          height: 37,
        ),
        BooksAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
