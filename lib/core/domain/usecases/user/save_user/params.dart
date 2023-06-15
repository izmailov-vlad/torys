part of domain;

class SaveUserParams {
  final String? name;
  final String? email;
  final UserPhotoModel? userPhoto;

  const SaveUserParams({
    this.name,
    this.email,
    this.userPhoto,
  });
}
