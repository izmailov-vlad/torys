import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetch() = FetchEvent;
}