part of 'bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.init() = InitState;

  const factory HomeState.fetched({
    required CategoriesBooksUIModel booksByCategories,
    required List<CategoryUIModel> categories,
    required List<BookUiModel> books,
    required List<BookUiModel> newBooks,
  }) = FetchedState;

  const factory HomeState.navigateToBookDetail({required BookUiModel book}) = NavigateToBookDetailState;

  const factory HomeState.navigateToBooks({required BooksUiModel books}) = NavigateToBooksState;

  const factory HomeState.loading() = LoadingState;

  const factory HomeState.error(BaseError error) = ErrorState;
}
