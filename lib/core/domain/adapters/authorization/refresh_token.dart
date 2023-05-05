part of domain;

extension RefreshTokenModelExtension on RefreshTokenModel {
  AuthUI toAuth() {
    return AuthUI(success: token.isNotEmpty);
  }
}