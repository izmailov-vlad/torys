part of domain;

class GoogleAuthModel {
  final String accessToken;
  final UserModel user;

  GoogleAuthModel({
    required this.accessToken,
    required this.user,
  });
}
