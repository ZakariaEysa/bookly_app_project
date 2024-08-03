import 'package:bookly_app_project/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: CustomSearchTextField()),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  "Search Result",
                  style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const SliverFillRemaining(
            child: SearchResultListView(),
          )
          //    const SliverFillRemaining(child: SearchResultListView()),
        ],
      ),
    );
  }
}
