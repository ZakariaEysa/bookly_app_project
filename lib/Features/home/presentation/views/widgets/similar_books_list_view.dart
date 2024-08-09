// import 'package:bookly_app_project/Features/home/presentation/view_model/related_books_cubit/related_books_cubit.dart';
// import 'package:bookly_app_project/core/utils/assets.dart';
// import 'package:bookly_app_project/core/widgets/custom_error_widget.dart';
// import 'package:bookly_app_project/core/widgets/custom_loading_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// import 'books_list_view_item.dart';

// class SimilarBooksListView extends StatelessWidget {
//   const SimilarBooksListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RelatedBooksCubit, RelatedBooksState>(
//       builder: (context, state) {
//         if (state is RelatedBooksSuccess) {
//           return SizedBox(
//             height: MediaQuery.sizeOf(context).height * .17,
//             child: Padding(
//               padding: const EdgeInsetsDirectional.only(start: 18),
//               child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 itemBuilder: (context, index) => Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       GoRouter.of(context).pushReplacement('/bookDetailsView',
//                           extra: state.books[index]);
//                     },
//                     child: BooksListViewItem(
//                       imageUrl: state
//                               .books[index].volumeInfo?.imageLinks?.thumbnail ??
//                           AssetsData.testImage,
//                     ),
//                   ),
//                 ),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: state.books.length,
//               ),
//             ),
//           );
//         } else if (state is RelatedBooksFailure) {
//           return CustomErrorWidget(state.message);
//         } else {
//           return const Center(
//             child: CustomLoadingIndicator(),
//           );
//         }
//       },
//     );
//   }
// }
