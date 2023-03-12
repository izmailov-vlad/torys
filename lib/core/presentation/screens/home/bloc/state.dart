import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entities/genre.dart';

part 'state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.init() = InitState;

  const factory HomeState.fetched({
    required List<Genre> genres,
  }) = FetchedState;

  const factory HomeState.loading() = LoadingState;

  const factory HomeState.error() = ErrorState;
}
