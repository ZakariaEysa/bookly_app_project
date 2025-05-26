import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_book_image_loading_indicator.dart';

class FeaturedBooksListViewLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height * .3,
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 18.w),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(end: 12.w),
              child: const CustomBookImageLoadingIndicator(),
            ),
            scrollDirection: Axis.horizontal,
            itemCount: 15,
          ),
        ));
  }
}
