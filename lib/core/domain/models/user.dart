part of domain;

class UserModel {
  final int id;
  final String email;
  final String name;
  final String? photo;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.photo,
  });
}