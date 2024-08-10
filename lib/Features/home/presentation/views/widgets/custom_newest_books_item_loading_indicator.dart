import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_book_image_loading_indicator.dart';

class CustomNewestBooksItemLoadingIndicator extends StatelessWidget {
  const CustomNewestBooksItemLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          const CustomBookImageLoadingIndicator(),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildShimmerLine(context, height: 16),
                const SizedBox(height: 8),
                _buildShimmerLine(context, height: 14, widthFactor: 0.7),
                const SizedBox(height: 8),
                _buildShimmerLine(context, height: 14, widthFactor: 0.5),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerLine(BuildContext context,
      {required double height, double widthFactor = 1.0}) {
    return Shimmer.fromColors(
      loop: 900,
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        height: height,
        width: MediaQuery.sizeOf(context).width * widthFactor,
        color: Colors.white38,
      ),
    );
  }
}
