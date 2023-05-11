part of domain;

extension GoogleAuthExtension on GoogleAuthModel {
  GoogleAuthUiModel toUiModel() {
    return GoogleAuthUiModel(accessToken: accessToken);
  }
}