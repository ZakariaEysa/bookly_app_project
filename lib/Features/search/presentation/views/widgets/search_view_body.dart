import 'package:BookNest/Features/search/presentation/views/widgets/searched_list_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, this.initialQuery});

  final String? initialQuery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: CustomSearchTextField(initialQuery: initialQuery)),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Text(
                  "Search Result",
                  style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
          const SliverFillRemaining(
            child: Column(
              children: [
                SearchedListBlocConsumer(),
              ],
            ),
          )
          //   const SliverFillRemaining(child: SearchedListBlocConsumer()),
        ],
      ),
    );
  }
}
