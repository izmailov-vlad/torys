import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<ProfileState>;

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final LogoutUseCase _logoutUseCase;
  final DeleteUserUseCase _deleteUserUseCase;
  final UserUpdatePhotoUseCase _userUpdatePhotoUseCase;

  ProfileBloc(
    this._userUpdatePhotoUseCase,
    this._getCurrentUserUseCase,
    this._logoutUseCase,
    this._deleteUserUseCase,
  ) : super(const ProfileInitState()) {
    on<ProfileLoad>(_load);
    on<ProfileLogout>(_logout);
    on<ProfileDelete>(_delete);
    on<ProfileTakePhoto>(_takePhoto);
    on<ProfileUpdatePhoto>(_updatePhoto);
  }

  Future<void> _takePhoto(ProfileTakePhoto event, _Emit emit) async {}

  Future<void> _updatePhoto(ProfileUpdatePhoto event, _Emit emit) async {
    await _userUpdatePhotoUseCase(UserPhotoModel(
      userPhotoPath: event.photoPath,
      userPhotoName: event.photoName,
    ));

    final user = await _getCurrentUserUseCase(const NoParams());
    if (user == null) return;
    emit(FetchedState(user: user));
  }

  Future<void> _load(ProfileLoad event, _Emit emit) async {
    final user = await _getCurrentUserUseCase(const NoParams());
    if (user == null) return;
    emit(FetchedState(user: user));
  }

  Future<void> _delete(ProfileDelete event, _Emit emit) async {
    final deleted = await _deleteUserUseCase(const NoParams());
    if (deleted == null || !deleted) return;
    emit(const ProfileState.logout());
  }

  Future<void> _logout(ProfileLogout event, _Emit emit) async {
    final user = await _logoutUseCase(const NoParams());
    if (user == null) return;
    emit(const ProfileState.logout());
  }
}
