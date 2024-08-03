import 'package:bookly_app_project/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';

import 'books_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .17,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 18),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => const BooksListViewItem(
            imageUrl: AssetsData.testImage,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 15,
        ),
      ),
    );
  }
}
