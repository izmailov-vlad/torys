part of domain;

extension RegisterModelExtension on RegisterModel {
  RegisterUI toRegister() {
    return RegisterUI(
      user: user.toUserUiModel(),
    );
  }
}