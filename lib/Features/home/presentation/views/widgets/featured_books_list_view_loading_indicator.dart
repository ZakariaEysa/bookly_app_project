import 'package:bookly_app_project/Features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:bookly_app_project/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
        child: SizedBox(
      height: MediaQuery.sizeOf(context).height * .3,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 18),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: CustomBookImageLoadingIndicator(),
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 15,
        ),
      ),
    ));
  }
}
