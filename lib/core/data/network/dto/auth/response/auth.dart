part of data;

@JsonSerializable()
class AuthResultDto {
  @Named('token')
  final String token;
  @Named('user')
  final UserDto user;

  AuthResultDto(this.token, this.user);

  factory AuthResultDto.fromJson(Map<String, dynamic> json) =>
      _$AuthResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResultDtoToJson(this);
}
