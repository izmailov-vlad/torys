part of data;

@JsonSerializable()
class GoogleAuthResultDto {
  final bool success;
  final String token;
  final UserDto user;

  GoogleAuthResultDto(this.success, this.token, this.user);

  factory GoogleAuthResultDto.fromJson(Map<String, dynamic> json) =>
      _$GoogleAuthResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleAuthResultDtoToJson(this);
}
