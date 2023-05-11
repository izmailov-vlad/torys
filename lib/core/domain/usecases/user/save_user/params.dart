part of domain;

class SaveUserParams {
  final String name;
  final String surname;
  final String email;

  const SaveUserParams({
    required this.name,
    required this.surname,
    required this.email,
  });
}