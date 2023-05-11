part of domain;

@Injectable()
class GoogleLoginUseCase
    implements UseCase<GoogleAuthUiModel?, GoogleLoginParams> {
  final GoogleAuthRepository _googleAuthRepository;
  final AppSecureStorage _appSecureStorage;
  final AppDatabase _appDatabase;

  GoogleLoginUseCase(
    this._googleAuthRepository,
    this._appSecureStorage,
    this._appDatabase,
  );

  @override
  Future<GoogleAuthUiModel?> call(GoogleLoginParams params) async {
    final token = (await params.account.authentication).accessToken;
    final result = await _googleAuthRepository.login(
      request: GoogleAuthRequestDto(
        accessToken: token,
        id: params.account.id,
        email: params.account.email,
        name: params.account.displayName,
      ),
    );
    if (result == null) return null;
    await _appSecureStorage.setAccessToken(result.accessToken);
    await _appDatabase.insertUser(result.user.toCompanion());
    return result.toUiModel();
  }
}
