part of 'related_books_cubit.dart';

@immutable
sealed class RelatedBooksState {}

final class RelatedBooksInitial extends RelatedBooksState {}

final class RelatedBooksLoading extends RelatedBooksState {}

final class RelatedBooksSuccess extends RelatedBooksState {
  final List<BookEntity> books;

  RelatedBooksSuccess(this.books);
}

final class RelatedBooksFailure extends RelatedBooksState {
  final String message;

  RelatedBooksFailure(this.message);
}

final class RelatedBooksPaginationLoading extends RelatedBooksState {}

final class RelatedBooksPaginationFailure extends RelatedBooksState {
  final String errorMessage;

  RelatedBooksPaginationFailure(this.errorMessage);
}
