part of data;

@JsonSerializable()
class RegisterResponseDto {
  final String token;
  final UserDto user;

  RegisterResponseDto(this.user, this.token);

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseDtoToJson(this);
}
