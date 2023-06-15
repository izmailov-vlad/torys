part of wishes_bloc;

@freezed
class WishesState with _$WishesState {
  const factory WishesState.init() = WishesInitState;
  const factory WishesState.loading() = WishesLoadingState;
  const factory WishesState.fetched({required Map<int, bool> selectedCategories, required List<CategoryUIModel> categories}) = WishesFetchedState;
  const factory WishesState.categorySelected({required Map<int, bool> selectedCategories}) = WishesCategoriesSelectedState;
  const factory WishesState.saved() = WishesSavedState;
}