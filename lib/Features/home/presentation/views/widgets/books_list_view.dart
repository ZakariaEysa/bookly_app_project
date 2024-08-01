import 'package:flutter/cupertino.dart';

import 'books_list_view_item.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .3,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 18),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => const BooksListViewItem(),
          scrollDirection: Axis.horizontal,
          itemCount: 15,
        ),
      ),
    );
  }
}
