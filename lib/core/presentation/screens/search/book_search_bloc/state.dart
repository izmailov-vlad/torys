part of book_search_bloc;

@Freezed(equal: false)
class BookSearchState with _$BookSearchState {
  const factory BookSearchState.init() = BookSearchInitState;
  const factory BookSearchState.booksFetched({required BooksUiModel books}) = BookSearchBooksFetchedState;
  const factory BookSearchState.listState({required bool show}) = BookSearchListState;
  const factory BookSearchState.eraseQuery() = BookSearchEraseQueryState;
  const factory BookSearchState.notFound() = BookSearchNotFoundState;
  const factory BookSearchState.booksLoading() = BookLoadingState;
}
