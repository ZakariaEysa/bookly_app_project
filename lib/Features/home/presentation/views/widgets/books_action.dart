import 'package:BookNest/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/lunch_url.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookEntity bookModel;

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              textColor: Colors.black,
              text: "Free",
              backGroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () => customLaunchUrl(context, bookModel.previewLink),
              fontSize: 16,
              textColor: Colors.white,
              text: getText,
              backGroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String get getText {
    if (bookModel.previewLink.isNotEmpty) {
      return 'Preview';
    } else {
      return 'Not Available';
    }
  }
}
