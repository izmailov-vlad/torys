import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'event.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.load() = Load;
}
