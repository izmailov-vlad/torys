part of data;

@JsonSerializable()
class UserDto {
  final int id;
  final String name;
  final String email;

  UserDto({required this.id,required this.name, required this.email});

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
