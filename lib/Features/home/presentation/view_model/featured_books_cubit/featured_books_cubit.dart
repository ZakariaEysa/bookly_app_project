import 'package:bloc/bloc.dart';
import 'package:bookly_app_project/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_project/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_project/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../domain/repos/home_repo.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    emit(FeaturedBooksLoading());
    var result = await fetchFeaturedBooksUseCase.call(pageNumber);
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errorMessage.toString()));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
