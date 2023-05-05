part of domain;

abstract class AuthRepository {
  Future<AuthModel?> login(AuthRequestDto authRequestDto);

  Future<RegisterModel?> register(RegisterRequestDto registerRequestDto);

  Future<RefreshTokenModel?> refreshToken(RefreshTokenRequestDto request);

  Future<LogoutModel?> logout();
}

