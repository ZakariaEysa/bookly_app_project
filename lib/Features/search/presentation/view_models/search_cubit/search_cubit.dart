import 'package:bloc/bloc.dart';
import 'package:BookNest/Features/search/domain/use_cases/fetch_searched_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../home/domain/entities/book_entity.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.fetchSearchedBooksUseCase) : super(SearchInitial());

  final FetchSearchedBooksUseCase fetchSearchedBooksUseCase;

  Future<void> fetchSearchedBooks(
      {int pageNumber = 0, required String userQuery}) async {
    if (pageNumber == 0) {
      emit(SearchBooksLoading());
    }
    emit(SearchBooksPaginationLoading());

    var result = await fetchSearchedBooksUseCase.call(pageNumber, userQuery);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(SearchBooksFailure(failure.errorMessage.toString()));
      }

      emit(SearchBooksPaginationFailure(failure.errorMessage.toString()));
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}
