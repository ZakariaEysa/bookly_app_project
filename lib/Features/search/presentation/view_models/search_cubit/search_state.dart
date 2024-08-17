part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchBooksLoading extends SearchState {}

final class SearchBooksPaginationLoading extends SearchState {}

final class SearchBooksPaginationFailure extends SearchState {
  final String errorMessage;

  SearchBooksPaginationFailure(this.errorMessage);
}

final class SearchBooksSuccess extends SearchState {
  final List<BookEntity> books;

  SearchBooksSuccess(this.books);
}

final class SearchBooksFailure extends SearchState {
  final String error;

  SearchBooksFailure(this.error);
}
