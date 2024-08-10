import 'package:bloc/bloc.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../domain/repos/home_repo.dart';
import '../../../domain/use_cases/fetch_featured_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errorMessage.toString()));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
