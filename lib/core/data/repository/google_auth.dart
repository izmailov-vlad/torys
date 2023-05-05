part of data;

@Injectable(as: GoogleAuthRepository)
class GoogleAuthRepositoryImpl extends GoogleAuthRepository {
  final GoogleAuthService _googleAuthService;

  GoogleAuthRepositoryImpl(this._googleAuthService);

  @override
  Future<GoogleAuthModel?> login() async {
    final result = await _googleAuthService.auth();
    return result?.toModel();
  }
}
