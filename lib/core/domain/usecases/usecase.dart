import 'package:freezed_annotation/freezed_annotation.dart';

part 'usecase.freezed.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

@Freezed(toJson: false, fromJson: false)
class NoParams with _$NoParams {
  const factory NoParams() = _NoParams;
}