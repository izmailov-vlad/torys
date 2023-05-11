part of domain;

@Injectable()
class RegisterUseCase implements UseCase<RegisterUI?, RegisterParams> {
  final AuthRepository _userRepository;
  final AppSecureStorage _appSecureStorage;
  final AppDatabase _appDatabase;

  RegisterUseCase(
    this._userRepository,
    this._appSecureStorage,
    this._appDatabase,
  );

  @override
  Future<RegisterUI?> call(params) async {
    final result = await _userRepository.register(
      RegisterRequestDto(
        params.email,
        params.name,
        params.password,
      ),
    );
    if (result == null) return null;
    await _appSecureStorage.setAccessToken(result.token);
    await _appDatabase.insertUser(result.user.toCompanion());
    return result.toRegister();
  }
}
