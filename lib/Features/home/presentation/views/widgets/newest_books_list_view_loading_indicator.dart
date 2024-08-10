import 'package:flutter/cupertino.dart';

import 'custom_newest_books_item_loading_indicator.dart';

class NewestBooksListViewLoadingIndicator extends StatelessWidget {
  const NewestBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
              child: CustomNewestBooksItemLoadingIndicator());
        });
  }
}
