part of data;

extension UserExtension on UserDto {
  UserModel toModel() {
    return UserModel(
      id: id,
      email: email,
      name: name,
      photo: photo,
    );
  }
}