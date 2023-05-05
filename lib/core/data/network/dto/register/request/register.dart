part of data;

@JsonSerializable()
class RegisterRequestDto {
  final String name;
  final String email;
  final String password;

  RegisterRequestDto(this.email, this.name, this.password);

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);
}