part of domain;

extension AuthModelExtension on AuthModel {
  AuthUI toAuth() {
    return AuthUI(success: token.isNotEmpty);
  }
}