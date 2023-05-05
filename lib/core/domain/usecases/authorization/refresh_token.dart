part of domain;

abstract class RefreshTokenUseCase {
  Future<String?> call();
}

@Injectable(as: RefreshTokenUseCase)
class RefreshTokenUseCaseImpl extends RefreshTokenUseCase {
  final AuthRepository _userRepository;
  final AppDatabase _appDatabase;
  final AppSecureStorage _appSecureStorage;

  RefreshTokenUseCaseImpl(
      this._userRepository, this._appDatabase, this._appSecureStorage);

  @override
  Future<String?> call() async {
    final user = await _appDatabase.getUser();
    if (user != null) {
      final result = await _userRepository.refreshToken(
        RefreshTokenRequestDto(user.id),
      );
      if (result == null) return null;
      _appSecureStorage.setSuccessToken(result.token);
      return result.token;
    }

    return null;
  }
}
