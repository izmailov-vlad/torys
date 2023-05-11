part of data;

@Injectable(as: GoogleAuthRepository)
class GoogleAuthRepositoryImpl extends GoogleAuthRepository {
  final GoogleAuthService _googleAuthService;

  GoogleAuthRepositoryImpl(this._googleAuthService);

  @override
  Future<GoogleAuthModel?> login({required GoogleAuthRequestDto request}) async {
    final result = await _googleAuthService.auth(request: request);
    return result?.toModel();
  }
}
