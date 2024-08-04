import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'related_books_state.dart';

class RelatedBooksCubit extends Cubit<RelatedBooksState> {
  RelatedBooksCubit(this.homeRepo) : super(RelatedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchRelatedBooks({required String category}) async {
    emit(RelatedBooksLoading());
    var result = await homeRepo.fetchRelatedBooks(category: category);
    result.fold((failure) {
      emit(RelatedBooksFailure(failure.errorMessage.toString()));
    }, (books) {
      emit(RelatedBooksSuccess(books));
    });
  }
}
