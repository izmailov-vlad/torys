import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:torys/core/domain/usecases/login.dart';
import 'package:torys/core/domain/usecases/register.dart';

import 'package:torys/core/presentation/router/bloc/bloc.dart';
import 'package:torys/core/presentation/router/bloc/event.dart';
import 'package:torys/core/presentation/screens/authorization/bloc/state.dart';
import 'package:torys/utils/result.dart';

import 'event.dart';

typedef Authorization = Stream<AuthorizationState>;

@Injectable()
class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final RouterEventSink _routerEventSink;
  final RegisterUseCase _registerUseCase;
  final LogInUseCase _logInUseCase;

  AuthorizationBloc(
    this._logInUseCase,
    this._registerUseCase,
    this._routerEventSink,
  ) : super(
          AuthorizationState(),
        ) {
    add(AuthorizationEvent.checkUser());
  }

  @override
  Stream<AuthorizationState> mapEventToState(AuthorizationEvent event) =>
      event.when(
          checkUser: _checkUser,
          onAcceptButtonPressed: _onAcceptButtonPressed,
          requestFocusOnInput: _requestFocusOnInput,
          onForgotPasswordPressed: _onForgotPasswordPressed,
          changeScreenType: _changeScreenType);

  Authorization _checkUser() async* {
    yield state.copyWith(authorizationStatus: AuthorizationStatus.loaded);
  }

  Authorization _onAcceptButtonPressed(
      String email, String name, String password) async* {
    final Result result;
    switch (state.screenType) {
      case ScreenType.authorization:
        if (email.isEmpty || password.isEmpty) {
          yield state.copyWith(inputDataStatus: InputDataStatus.invalid);
          return;
        }
        result = await _logInUseCase(
          email,
          password,
        );

        break;
      case ScreenType.registration:
        if (email.isEmpty || password.isEmpty) {
          yield state.copyWith(inputDataStatus: InputDataStatus.invalid);
          return;
        }
        result = await _registerUseCase(
          email,
          name,
          password,
        );
        break;
    }

    if (result.isSuccess) {
      _routerEventSink.add(RouterEvent.pop());
      _routerEventSink.add(RouterEvent.toMain());
      return;
    }

    yield state.copyWith(inputDataStatus: InputDataStatus.invalid);
  }

  Authorization _onForgotPasswordPressed() async* {
    yield state.copyWith(
      inputDataStatus: InputDataStatus.valid,
      screenType: ScreenType.registration,
    );
  }

  Authorization _requestFocusOnInput(InputType requestedInput) async* {
    yield state.copyWith(
      activeInput: requestedInput,
    );
  }

  Authorization _changeScreenType() async* {
    if (state.screenType == ScreenType.authorization) {
      yield state.copyWith(screenType: ScreenType.registration);
    } else {
      yield state.copyWith(screenType: ScreenType.authorization);
    }
  }
}
