import 'package:bloc/bloc.dart';
import 'package:bookly_app_project/Features/home/domain/use_cases/fetch_related_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'related_books_state.dart';

class RelatedBooksCubit extends Cubit<RelatedBooksState> {
  RelatedBooksCubit(this.fetchRelatedBooksUseCase)
      : super(RelatedBooksInitial());

  final FetchRelatedBooksUseCase fetchRelatedBooksUseCase;

  Future<void> fetchRelatedBooks(
      {required String category, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(RelatedBooksLoading());
    }

    emit(RelatedBooksPaginationLoading());
    var result = await fetchRelatedBooksUseCase.call(pageNumber, category);

    result.fold((failure) {
      if (pageNumber == 0) {
        emit(RelatedBooksFailure(failure.errorMessage.toString()));
      }

      emit(RelatedBooksPaginationFailure(failure.errorMessage.toString()));
    }, (books) {
      emit(RelatedBooksSuccess(books));
    });
  }
}
