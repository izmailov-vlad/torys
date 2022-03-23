import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'event.freezed.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.load() = Load;
}
