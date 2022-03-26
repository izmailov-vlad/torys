import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:torys/core/presentation/screens/main/bloc/state.dart';
part 'event.freezed.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.load() = Load;
  const factory MainEvent.changeScreen(Screen destination) = ChangeScreen;
}
