part of wishes_bloc;

@Freezed(makeCollectionsUnmodifiable: false)
class WishesEvent with _$WishesEvent {
  const factory WishesEvent.load() = WishesLoadEvent;

  factory WishesEvent.onCategoryTap({
    required int id,
    required Map<int, bool> selectedCategories,
    required List<CategoryUIModel> categories,
  }) = WishesOnCategoryTapEvent;

  const factory WishesEvent.save({required Map<int, bool> selectedCategories}) =
      WishesSaveEvent;
}
