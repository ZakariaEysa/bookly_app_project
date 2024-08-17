import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/domain/entities/book_entity.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

//
// final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
//
// Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
//   if (pageNumber == 0) {
//     emit(FeaturedBooksLoading());
//   }
//   emit(FeaturedBooksPaginationLoading());
//
//   var result = await fetchFeaturedBooksUseCase.call(pageNumber);
//   result.fold((failure) {
//     if (pageNumber == 0) {
//       emit(FeaturedBooksFailure(failure.errorMessage.toString()));
//     }
//
//     emit(FeaturedBooksPaginationFailure(failure.errorMessage.toString()));
//   }, (books) {
//     emit(FeaturedBooksSuccess(books));
//   });
// }
}
