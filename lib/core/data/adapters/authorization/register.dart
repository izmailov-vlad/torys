part of data;

extension RegisterExtension on RegisterResponseDto {
  RegisterModel toModel() {
    return RegisterModel(
      token: token,
      user: UserModel(
        id: user.id,
        email: user.email,
        name: user.name,
      ),
    );
  }
}
