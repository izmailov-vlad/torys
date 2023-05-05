part of data;

abstract class GoogleAuthService {
  Future<GoogleAuthResultDto?> auth();

  Future<UserDto?> getUser();
}

@Injectable(as: GoogleAuthService)
class GoogleAuthServiceImpl implements GoogleAuthService {
  final ApiClient _apiClient;

  GoogleAuthServiceImpl(this._apiClient);
  @override
  Future<GoogleAuthResultDto?> auth() async {
    final result = await _apiClient.googleAuth();
    return GoogleAuthResultDto.fromJson(result.data);
  }

  @override
  Future<UserDto?> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
