import 'best_seller_list_view.dart';
import 'featured_books_list_view_bloc_consumer_.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_home_view_app_bar.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CustomHomeViewAppBar(),
            ),
          FeaturedBooksListViewBlocConsumer(),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Newest Books",
                style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
              ),
            ),
            const SizedBox(height: 20),
          ]),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}
