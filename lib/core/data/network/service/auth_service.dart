part of data;

abstract class AuthService {
  Future<AuthResultDto?> authorize(AuthRequestDto authRequestDto);

  Future<RegisterResponseDto?> register(RegisterRequestDto registerRequestDto);

  Future<RefreshTokenResponseDto?> refreshToken(RefreshTokenRequestDto request);

  Future<LogoutResponseDto?> logout();
}

@Injectable(as: AuthService)
class AuthServiceImpl implements AuthService {
  final ApiClient _apiClient;

  AuthServiceImpl(this._apiClient);

  @override
  Future<AuthResultDto?> authorize(authRequestDto) async {
    final authJson = await _apiClient.auth(authRequestDto);
    if (authJson.data == null) return null;
    final AuthResultDto authResultDto =
        AuthResultDto.fromJson(authJson.data['data']);
    return authResultDto;
  }

  @override
  Future<RegisterResponseDto?> register(registerRequestDto) async {
    final registerJson = await _apiClient.register(registerRequestDto);
    if (registerJson.data == null) return null;
    final RegisterResponseDto registerResponseDto =
        RegisterResponseDto.fromJson(registerJson.data['data']);
    return registerResponseDto;
  }

  @override
  Future<RefreshTokenResponseDto?> refreshToken(
      RefreshTokenRequestDto request) async {
    final refreshJson = await _apiClient.refreshToken(request.userId);
    if (refreshJson.data == null) return null;
    final RefreshTokenResponseDto refreshTokenResultDto =
        RefreshTokenResponseDto.fromJson(refreshJson.data);
    return refreshTokenResultDto;
  }

  @override
  Future<LogoutResponseDto?> logout() async {
    final logoutJson = await _apiClient.logout();
    final logoutDto = LogoutResponseDto.fromJson(logoutJson.data);
    return logoutDto;
  }
}
