import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<LaunchState>;

@Injectable()
class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  final CheckAuthUseCase _checkAuthUseCase;
  final CheckUserSelectedWishes _checkUserSelectedWishes;

  LaunchBloc(this._checkAuthUseCase, this._checkUserSelectedWishes)
      : super(const LaunchState.init()) {
    on<_CheckAuthEvent>(_checkAuth);
  }

  Future<void> _checkAuth(_CheckAuthEvent event, _Emit emit) async {
    try {
      final isAuth = await _checkAuthUseCase(const NoParams());
      if (isAuth) {
        final isWishesPassed = await _checkUserSelectedWishes(const NoParams());
        if (isWishesPassed) {
          emit(const LaunchState.navigateTo(NavigateToRoute.main));
        } else {
          emit(const LaunchState.navigateTo(NavigateToRoute.wishes));
        }
        return;
      }
      emit(const LaunchState.navigateTo(NavigateToRoute.auth));
    } catch (error, stackTrace) {
      ErrorHandler.catchError(
        error,
        stackTrace,
        (error) {
          emit(const LaunchState.navigateTo(NavigateToRoute.auth));
        },
      );
    }
  }
}
