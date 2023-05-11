part of domain;

abstract class GoogleAuthRepository {
  Future<GoogleAuthModel?> login({required GoogleAuthRequestDto request});
}