// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MainEventTearOff {
  const _$MainEventTearOff();

  Load load() {
    return const Load();
  }

  ChangeScreen changeScreen(Screen destination) {
    return ChangeScreen(
      destination,
    );
  }
}

/// @nodoc
const $MainEvent = _$MainEventTearOff();

/// @nodoc
mixin _$MainEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Screen destination) changeScreen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Screen destination)? changeScreen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Screen destination)? changeScreen,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Load value) load,
    required TResult Function(ChangeScreen value) changeScreen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(ChangeScreen value)? changeScreen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(ChangeScreen value)? changeScreen,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainEventCopyWith<$Res> {
  factory $MainEventCopyWith(MainEvent value, $Res Function(MainEvent) then) =
      _$MainEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MainEventCopyWithImpl<$Res> implements $MainEventCopyWith<$Res> {
  _$MainEventCopyWithImpl(this._value, this._then);

  final MainEvent _value;
  // ignore: unused_field
  final $Res Function(MainEvent) _then;
}

/// @nodoc
abstract class $LoadCopyWith<$Res> {
  factory $LoadCopyWith(Load value, $Res Function(Load) then) =
      _$LoadCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadCopyWithImpl<$Res> extends _$MainEventCopyWithImpl<$Res>
    implements $LoadCopyWith<$Res> {
  _$LoadCopyWithImpl(Load _value, $Res Function(Load) _then)
      : super(_value, (v) => _then(v as Load));

  @override
  Load get _value => super._value as Load;
}

/// @nodoc

class _$Load with DiagnosticableTreeMixin implements Load {
  const _$Load();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainEvent.load()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MainEvent.load'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Load);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Screen destination) changeScreen,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Screen destination)? changeScreen,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Screen destination)? changeScreen,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Load value) load,
    required TResult Function(ChangeScreen value) changeScreen,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(ChangeScreen value)? changeScreen,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(ChangeScreen value)? changeScreen,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class Load implements MainEvent {
  const factory Load() = _$Load;
}

/// @nodoc
abstract class $ChangeScreenCopyWith<$Res> {
  factory $ChangeScreenCopyWith(
          ChangeScreen value, $Res Function(ChangeScreen) then) =
      _$ChangeScreenCopyWithImpl<$Res>;
  $Res call({Screen destination});
}

/// @nodoc
class _$ChangeScreenCopyWithImpl<$Res> extends _$MainEventCopyWithImpl<$Res>
    implements $ChangeScreenCopyWith<$Res> {
  _$ChangeScreenCopyWithImpl(
      ChangeScreen _value, $Res Function(ChangeScreen) _then)
      : super(_value, (v) => _then(v as ChangeScreen));

  @override
  ChangeScreen get _value => super._value as ChangeScreen;

  @override
  $Res call({
    Object? destination = freezed,
  }) {
    return _then(ChangeScreen(
      destination == freezed
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Screen,
    ));
  }
}

/// @nodoc

class _$ChangeScreen with DiagnosticableTreeMixin implements ChangeScreen {
  const _$ChangeScreen(this.destination);

  @override
  final Screen destination;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainEvent.changeScreen(destination: $destination)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainEvent.changeScreen'))
      ..add(DiagnosticsProperty('destination', destination));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeScreen &&
            const DeepCollectionEquality()
                .equals(other.destination, destination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(destination));

  @JsonKey(ignore: true)
  @override
  $ChangeScreenCopyWith<ChangeScreen> get copyWith =>
      _$ChangeScreenCopyWithImpl<ChangeScreen>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Screen destination) changeScreen,
  }) {
    return changeScreen(destination);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Screen destination)? changeScreen,
  }) {
    return changeScreen?.call(destination);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Screen destination)? changeScreen,
    required TResult orElse(),
  }) {
    if (changeScreen != null) {
      return changeScreen(destination);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Load value) load,
    required TResult Function(ChangeScreen value) changeScreen,
  }) {
    return changeScreen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(ChangeScreen value)? changeScreen,
  }) {
    return changeScreen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(ChangeScreen value)? changeScreen,
    required TResult orElse(),
  }) {
    if (changeScreen != null) {
      return changeScreen(this);
    }
    return orElse();
  }
}

abstract class ChangeScreen implements MainEvent {
  const factory ChangeScreen(Screen destination) = _$ChangeScreen;

  Screen get destination;
  @JsonKey(ignore: true)
  $ChangeScreenCopyWith<ChangeScreen> get copyWith =>
      throw _privateConstructorUsedError;
}
