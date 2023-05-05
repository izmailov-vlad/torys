part of 'bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.load() = SearchLoad;
  const factory SearchEvent.onCategoryTap({required int id}) = OnCategoryTap;
}
