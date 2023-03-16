import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../models/book.dart';
import '../../../models/genre.dart';

part 'state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.init() = InitState;

  const factory HomeState.fetched({
    required List<Genre> genres,
    required List<Book> books,
  }) = FetchedState;

  const factory HomeState.loading() = LoadingState;

  const factory HomeState.error() = ErrorState;
}
