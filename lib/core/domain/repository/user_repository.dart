part of domain;

abstract class AuthRepository {
  Future<AuthModel?> login(AuthRequestDto authRequestDto);

  Future<RegisterModel?> register(RegisterRequestDto registerRequestDto);

  Future<RefreshTokenModel?> refreshToken(RefreshTokenRequestDto request);

  Future<UserModel?> editUser(EditUserRequestDto request);

  Future<UserModel?> updatePhoto(MultipartFile photo);

  Future<LogoutModel?> logout();

  Future<bool?> delete();

  Future<bool?> userHaveWishes();
}

