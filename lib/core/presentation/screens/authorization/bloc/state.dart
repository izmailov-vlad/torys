import 'package:torys/core/presentation/entities/user.dart';

class AuthorizationState {
  final User? user;
  final ScreenType screenType;
  final InputType? inputType;
  final InputType? activeInput;
  final InputType? errorInput;
  final AuthorizationStatus? authorizationStatus;
  final InputDataStatus inputDataStatus;
  AuthorizationState({
    this.inputDataStatus = InputDataStatus.valid,
    this.authorizationStatus = AuthorizationStatus.loading,
    this.errorInput,
    this.activeInput,
    this.inputType,
    this.user,
    this.screenType = ScreenType.authorization,
  });

  AuthorizationState copyWith({
    InputDataStatus? inputDataStatus,
    AuthorizationStatus? authorizationStatus,
    InputType? errorInput,
    InputType? activeInput,
    InputType? inputType,
    ScreenType? screenType,
    User? user,
  }) {
    return AuthorizationState(
      inputDataStatus: inputDataStatus ?? this.inputDataStatus,
      authorizationStatus: authorizationStatus ?? this.authorizationStatus,
      errorInput: errorInput ?? this.errorInput,
      activeInput: activeInput ?? this.activeInput,
      inputType: inputType ?? this.inputType,
      screenType: screenType ?? this.screenType,
      user: user ?? this.user,
    );
  }
}

enum AuthorizationStatus {
  loaded,
  loading,
}

enum InputDataStatus {
  valid,
  invalid,
}

enum ScreenType {
  authorization,
  registration,
}

enum InputType {
  name,
  email,
  password,
  none,
}
