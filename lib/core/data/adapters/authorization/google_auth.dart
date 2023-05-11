part of data;

extension GoogleAuthExtension on GoogleAuthResultDto {
  GoogleAuthModel toModel() {
    return GoogleAuthModel(
      accessToken: token,
      user: user.toModel(),
    );
  }
}
