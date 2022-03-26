import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.load() = Load;
}
