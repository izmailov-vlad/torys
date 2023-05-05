part of data;

@JsonSerializable()
class AuthRequestDto {
  final String email;
  final String password;

  AuthRequestDto(this.email, this.password);

  factory AuthRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthRequestDtoToJson(this);
}