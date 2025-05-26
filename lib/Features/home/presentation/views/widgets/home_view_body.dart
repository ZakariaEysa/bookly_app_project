import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view_bloc_consumer.dart';
import 'custom_home_view_app_bar.dart';
import 'featured_books_list_view_bloc_consumer_.dart';

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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: const CustomHomeViewAppBar(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                "Popular Books",
                style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
              ),
            ),
            SizedBox(height: 20.h),
            const FeaturedBooksListViewBlocConsumer(),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                "Newest Books",
                style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
              ),
            ),
            SizedBox(height: 20.h),
          ]),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: const Column(
              children: [
                BestSellerListViewBlocConsumer(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
