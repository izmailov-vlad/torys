part of 'bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.init() = InitState;

  const factory HomeState.fetchedNewBooks({
    required List<BookUiModel> newBooks,
  }) = FetchedNewBooksState;

  const factory HomeState.fetchedPopularBooks({
    required List<BookUiModel> popularBooks,
  }) = FetchedPopularBooksState;

  const factory HomeState.fetchedCategories({
    required List<CategoryUIModel> categories,
  }) = FetchedCategoriesState;

  const factory HomeState.fetchedBooksByCategories({
    required CategoriesBooksUIModel booksByCategories,
  }) = FetchedBooksByCategoriesState;

  const factory HomeState.navigateToBookDetail({required BookUiModel book}) =
      NavigateToBookDetailState;

  const factory HomeState.navigateToBooks({required int categoryId}) =
      NavigateToBooksState;

  const factory HomeState.loading() = LoadingState;

  const factory HomeState.error(BaseError error) = ErrorState;
}
