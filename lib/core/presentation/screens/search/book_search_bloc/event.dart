part of book_search_bloc;

@freezed
class BookSearchEvent with _$BookSearchEvent {
  const factory BookSearchEvent.load() = BookSearchLoad;
  const factory BookSearchEvent.findByQuery({required String query}) = BookSearchFindByQuery;
  const factory BookSearchEvent.eraseSearchField() = BookSearchEraseField;
}
