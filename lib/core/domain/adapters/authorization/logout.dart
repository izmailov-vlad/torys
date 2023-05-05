part of domain;

extension LogoutExtension on LogoutModel {
  LogoutUiModel toUiModel() {
    return LogoutUiModel(success: success);
  }
}