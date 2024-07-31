import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view_item.dart';
import 'books_list_view.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomAppBar(),
        const BooksListView(),
        const SizedBox(height: 32),
        Text(
          "Best Seller",
          style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
        ),
        const SizedBox(height: 20),
        const BestSellerListViewItem()
      ]),
    );
  }
}
