part of presentation;

class UserUiModel {
  final int id;
  final String name;
  final String email;
  final String? photo;

  const UserUiModel({
    required this.id,
    required this.name,
    required this.email,
    this.photo,
  });
}
