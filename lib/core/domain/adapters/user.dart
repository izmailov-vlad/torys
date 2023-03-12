part of domain;

extension UserExtension on UserModel {
  User toUserData() {
    return User(
      name: name,
      password: password,
      email: email,
    );
  }
}
