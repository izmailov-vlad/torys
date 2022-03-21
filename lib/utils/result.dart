/// Holder for an object that either holds a result of a desired type [V], or failure [Failure].
///
/// Null safety ready.
class Result<V> {
  /// Forming [Result] with successful [value].
  ///
  /// [failure] will be `null` in this case
  Result.success(this._value);

  /// Forming [Result] with [failure].
  ///
  /// [value] will be `null` in this case
  Result.failure(this._failure);

  /// Successful value field. Null when [_failure] isn't.
  ///
  /// Immutable after constructor was called.
  V? _value;

  /// Failure value field. Null when [_value] isn't.
  ///
  /// Immutable after constructor was called.
  Failure? _failure;

  /// Successful value getter. Can return `null` even if failure not represented.
  V? get value => _value;

  /// Failure value getter. Can return `null` even if successful value not represented.
  Failure? get failure => _failure;

  /// Returns [Failure] value. Mostly [Exception] or [Error] instance.
  dynamic get failureValue => _failure?.value;

  /// Return [value] only if it exists or throws [NullThrownError] on `null` or [Failure] on failure.
  V? get valueOrThrow {
    if (isFailure) throw _failure!;
    if (_value == null) throw NullThrownError();
    return _value;
  }

  /// Returns `true` if failure not represented.
  ///
  /// [isFailure] parameter will return `false` in this case.
  bool get isSuccess => _failure == null;

  /// Returns `true` if value not represented.
  ///
  /// [isSuccess] parameter will return `false` in this case.
  ///
  /// Can return `null` even if value not represented.
  bool get isFailure => _value == null;

  /// Returns callback with [value] if it exists.
  void onSuccess(Function(V? value) action) {
    if (isSuccess) action(_value);
  }

  /// Returns callback with [failure] if it exists.
  void onFailure(Function(dynamic value) action) {
    if (isFailure) action(_failure);
  }

  /// Return value [T] based on [Result] state (failure or success).
  ///
  /// Example:
  ///
  /// ```dart
  /// Stream<SomeState> mapEventToState() async* {
  ///     final result = await _getSomeResult();
  ///
  ///     yield result.join(
  ///       (value) => SuccessState(value),
  ///       (failure) => FailureState(failure),
  ///     );
  ///   }
  /// ```
  T join<T>(
      T Function(V? value) onSuccess,
      T Function(Failure? failure) onFailure,
      ) {
    if (isSuccess) return onSuccess(value);

    return onFailure(failure);
  }

  @override
  String toString() {
    if (isFailure) return failure.toString();

    return 'Success: $value';
  }
}

/// Class represents failure and holds some failure value (for example, [Exception] or [Error] child).
class Failure {
  Failure(this.value, [this.message]);

  /// Dynamic failure value.
  final dynamic value;

  /// Optional failure message.
  final String? message;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Failure && value == other.value;
  }

  @override
  String toString() => 'Failure: { $value } with message: ${message ?? 'nevermind'}';
}
