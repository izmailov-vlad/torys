part of data;

extension AuthExtension on AuthResultDto {
  AuthModel toModel() {
    return AuthModel(
      token: token,
      user: UserModel(
        id: user.id,
        email: user.email,
        name: user.name,
      ),
    );
  }
}
