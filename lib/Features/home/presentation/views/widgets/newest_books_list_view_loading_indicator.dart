import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_newest_books_item_loading_indicator.dart';

class NewestBooksListViewLoadingIndicator extends StatelessWidget {
  const NewestBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 8.h),
                child: const CustomNewestBooksItemLoadingIndicator());
          }),
    );
  }
}
