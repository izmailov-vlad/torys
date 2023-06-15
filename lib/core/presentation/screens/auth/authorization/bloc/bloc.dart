import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../../utils/app_logger.dart';
import '../../../../presentation.dart';

part 'state.dart';

part 'event.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<AuthorizationState>;

@Injectable()
class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final LogInUseCase _logInUseCase;
  final RegisterUseCase _registerUseCase;
  final GoogleLoginUseCase _googleLoginUseCase;
  final CheckUserSelectedWishes _checkUserSelectedWishes;
  late final GoogleSignIn _googleSignIn;
  final List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  AuthorizationBloc(
    this._logInUseCase,
    this._registerUseCase,
    this._googleLoginUseCase,
    this._checkUserSelectedWishes,
  ) : super(const AuthorizationInitState()) {
    on<AuthorizationInitEvent>(_onInit);
    on<AuthorizationAuthEvent>(_onAuth);
    on<AuthorizationGoogleAuthEvent>(_onGoogleAuth);
    on<AuthorizationRegisterEvent>(_onRegister);
    on<AuthorizationChangeScreenStateEvent>(_onChangeScreen);
  }

  Future<void> _onInit(AuthorizationInitEvent event, _Emit emit) async {
    _googleSignIn = GoogleSignIn(
      scopes: scopes,
    );
  }

  Future<void> _onRegister(
    AuthorizationRegisterEvent event,
    _Emit emit,
  ) async {
    try {
      final registerResult = await _registerUseCase(
        RegisterParams(
          email: event.email,
          name: event.name,
          password: event.password,
        ),
      );
      if (registerResult == null) return;

      emit(const AuthorizationState.navigateToWishes());
    } catch (error, stackTrace) {
      ErrorHandler.catchError(
        error,
        stackTrace,
        (error) {
          emit(AuthorizationErrorState(error));
        },
      );
    }
  }

  Future<void> _onGoogleAuth(
    AuthorizationGoogleAuthEvent event,
    _Emit emit,
  ) async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) return;
      final result = await _googleLoginUseCase(
        GoogleLoginParams(
          account: account,
        ),
      );
      if (result == null) return;
      final isWishesPassed = await _checkUserSelectedWishes(const NoParams());
      if (isWishesPassed) {
        emit(const AuthorizationState.authSuccess());
        return;
      }
      emit(const AuthorizationState.navigateToWishes());
    } catch (error, stackTrace) {
      ErrorHandler.catchError(
        error,
        stackTrace,
        (error) {
          emit(AuthorizationErrorState(error));
        },
      );
    }
  }

  Future<void> _onAuth(AuthorizationAuthEvent event, _Emit emit) async {
    try {
      final authResult = await _logInUseCase(
        LoginParams(
          email: event.email,
          password: event.password,
        ),
      );
      if (authResult != null && authResult.success) {
        final isWishesPassed = await _checkUserSelectedWishes(const NoParams());
        if (isWishesPassed) {
          emit(const AuthorizationSuccessState());
          return;
        }
        emit(const AuthorizationState.navigateToWishes());
      }
    } catch (error, stackTrace) {
      ErrorHandler.catchError(
        error,
        stackTrace,
        (error) {
          emit(AuthorizationErrorState(error));
        },
      );
    }
  }

  Future<void> _onChangeScreen(
    AuthorizationChangeScreenStateEvent event,
    _Emit emit,
  ) async {
    emit(ChangeScreenState(event.screenState));
  }
}
