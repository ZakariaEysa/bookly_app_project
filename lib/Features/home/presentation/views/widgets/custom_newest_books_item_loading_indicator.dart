import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_book_image_loading_indicator.dart';

class CustomNewestBooksItemLoadingIndicator extends StatelessWidget {
  const CustomNewestBooksItemLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.h,
      child: Row(
        children: [
          const CustomBookImageLoadingIndicator(),
          SizedBox(width: 30.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildShimmerLine(context, height: 16.h),
                SizedBox(height: 8.h),
                _buildShimmerLine(context, height: 14.h, widthFactor: 0.7),
                SizedBox(height: 8.h),
                _buildShimmerLine(context, height: 14.h, widthFactor: 0.5),
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
