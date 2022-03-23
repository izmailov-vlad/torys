import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
class RouterEvent with _$RouterEvent {
  const factory RouterEvent.pop() = OnPop;
  const factory RouterEvent.toSplash() = ToSplash;
  const factory RouterEvent.toMain() = ToMain;
}
