part of 'bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.init() = SearchInitState;
  const factory SearchState.fetched({required List<CategoryUIModel> categories}) = SearchFetchedState;
  const factory SearchState.navigateToBooksByCategory({required BooksUiModel books}) = SearchNavigateToBooksByCategoryState;
  const factory SearchState.error({required BaseError error}) = SearchErrorState;
}
