part of data;

@JsonSerializable()
class UserDto {
  final int id;
  final String name;
  final String email;
  final String? photo;

  UserDto({
    required this.id,
    required this.name,
    required this.email,
    this.photo,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

@JsonSerializable()
class GoogleUserDto {
  final String id;
  final String? name;
  final String email;
  final String? photo;

  GoogleUserDto({
    required this.id,
    required this.email,
    this.name,
    this.photo,
  });

  factory GoogleUserDto.fromJson(Map<String, dynamic> json) =>
      _$GoogleUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleUserDtoToJson(this);
}
