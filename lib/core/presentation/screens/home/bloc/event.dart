part of 'bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetch() = FetchEvent;
  const factory HomeEvent.onChooseBook(String bookId) = ChooseBookEvent;
  const factory HomeEvent.onShowAllTap(int categoryId) = ShowAllEvent;
}