part of domain;

/// user is unauthorized is FALSE
/// user is authorized is TRUE

@Injectable()
class CheckAuthUseCase implements UseCase<bool, NoParams> {
  final AuthRepository _userRepository;
  final AppDatabase _databaseStorage;
  final AppSecureStorage _appSecureStorage;

  CheckAuthUseCase(
    this._userRepository,
    this._databaseStorage,
    this._appSecureStorage,
  );

  @override
  Future<bool> call(NoParams params) async {
    final user = await _databaseStorage.getUser();
    if (user != null) {
      final result = await _userRepository.refreshToken(
        RefreshTokenRequestDto(user.id),
      );
      if (result == null) return false;
      _appSecureStorage.setSuccessToken(result.token);
      return true;
    }
    return false;
  }
}
