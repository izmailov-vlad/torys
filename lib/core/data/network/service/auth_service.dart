part of data;

abstract class AuthService {
  Future<AuthResultDto?> authorize(AuthRequestDto authRequestDto);

  Future<RegisterResponseDto?> register(RegisterRequestDto registerRequestDto);

  Future<RefreshTokenResponseDto?> refreshToken(RefreshTokenRequestDto request);

  Future<UserDto?> editUser(EditUserRequestDto request);

  Future<UserDto?> updatePhoto(FormData formData);

  Future<LogoutResponseDto?> logout();

  Future<DefaultResultDto?> userHaveWishes();

  Future<DefaultResultDto?> delete();
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

  @override
  Future<UserDto?> editUser(EditUserRequestDto request) async {
    final editUserJson = await _apiClient.editUser(request);
    final userDto = UserDto.fromJson(editUserJson.data);
    return userDto;
  }

  @override
  Future<DefaultResultDto?> delete() async {
    final editUserJson = await _apiClient.deleteUser();
    final result = DefaultResultDto.fromJson(editUserJson.data);
    return result;
  }

  @override
  Future<DefaultResultDto?> userHaveWishes() async {
    final userHaveWishesJson = await _apiClient.userHaveWishes();
    final result = DefaultResultDto.fromJson(userHaveWishesJson.data);
    return result;
  }

  @override
  Future<UserDto?> updatePhoto(FormData formData) async {
    final userJson = await _apiClient.userUpdatePhoto(formData);
    final result = UserDto.fromJson(userJson.data);
    return result;
  }
}
