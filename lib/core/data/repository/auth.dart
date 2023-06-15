part of data;

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<AuthModel?> login(AuthRequestDto authRequestDto) async {
    final result = await _authService.authorize(authRequestDto);
    return result?.toModel();
  }

  @override
  Future<LogoutModel?> logout() async {
    final result = await _authService.logout();
    return result?.toModel();
  }

  @override
  Future<RegisterModel?> register(RegisterRequestDto registerRequestDto) async {
    final result = await _authService.register(registerRequestDto);
    if (result == null) return null;

    final authModel = result.toModel();
    return authModel;
  }

  @override
  Future<RefreshTokenModel?> refreshToken(
    RefreshTokenRequestDto request,
  ) async {
    final result = await _authService.refreshToken(request);
    if (result == null) return null;

    final authModel = result.toModel();
    return authModel;
  }

  @override
  Future<UserModel?> editUser(EditUserRequestDto request) async {
    final result = await _authService.editUser(request);
    if (result == null) return null;

    final authModel = result.toModel();
    return authModel;
  }

  @override
  Future<bool?> delete() async {
    final result = await _authService.delete();
    return result?.success;
  }

  @override
  Future<bool?> userHaveWishes() async {
    final result = await _authService.userHaveWishes();
    return result?.success;
  }

  @override
  Future<UserModel?> updatePhoto(MultipartFile photo) async {
    final result = await _authService.updatePhoto(FormData.fromMap({
      'photo': photo,
    }));
    return result?.toModel();
  }
}
