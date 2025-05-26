import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_book_image_loading_indicator.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: imageUrl.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                // placeholder: (context, url) => const Center(
                //   child: CupertinoActivityIndicator(),
                // ),
                placeholder: (context, url) =>
                    const CustomBookImageLoadingIndicator(),
              )
            : const Icon(Icons.error),
      ),
    );
  }
}
