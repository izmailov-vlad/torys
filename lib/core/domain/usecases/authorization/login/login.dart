part of domain;

@Injectable()
class LogInUseCase implements UseCase<AuthUI?, LoginParams> {
  final AuthRepository _userRepository;
  final AppSecureStorage _appSecureStorage;
  final AppDatabase _appDatabase;

  LogInUseCase(
    this._userRepository,
    this._appSecureStorage,
    this._appDatabase,
  );

  @override
  Future<AuthUI?> call(params) async {
    final result = await _userRepository.login(AuthRequestDto(
      params.email,
      params.password,
    ));
    if (result == null) return null;
    await _appSecureStorage.setAccessToken(result.token);
    await _appDatabase.insertUser(result.user.toCompanion());
    final authResult = result.toAuth();

    return authResult;
  }
}
