import 'package:BookNest/Features/home/presentation/views/widgets/similar_books_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../domain/entities/book_entity.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.bookModel});

  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You Can Also Like",
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 16,
        ),
        SimilarBooksListViewBlocConsumer(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
