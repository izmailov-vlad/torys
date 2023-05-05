part of domain;

extension UserExtension on UserModel {
  UserUiModel toUserUiModel() {
    return UserUiModel(
      id: id,
      name: name,
      email: email,
    );
  }

  UsersCompanion toCompanion() {
    return UsersCompanion(
      id: Value<int>(id),
      name: Value<String>(name),
      email: Value<String>(email),
    );
  }
}

extension UserEntityExtension on User {
  UserUiModel toUserUiModel() {
    return UserUiModel(
      id: id,
      name: name,
      email: email,
    );
  }
}
