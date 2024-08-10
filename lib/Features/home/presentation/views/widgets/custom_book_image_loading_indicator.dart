import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBookImageLoadingIndicator extends StatelessWidget {
  const CustomBookImageLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Shimmer.fromColors(
          loop: 900,
          baseColor: Colors.grey[300]!,
          direction: ShimmerDirection.ltr,
          highlightColor: Colors.white,
          child: Container(
            color: Colors.grey[50],
          ),
        ),
      ),
    );
  }
}
