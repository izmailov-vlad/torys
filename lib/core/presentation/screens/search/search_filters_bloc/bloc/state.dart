part of search_filters_bloc;

@freezed
class BookSearchFiltersState with _$BookSearchFiltersState {
  const factory BookSearchFiltersState.init() = BookSearchInitFiltersState;
  const factory BookSearchFiltersState.fetch() = BookSearchFetchFiltersState;
}