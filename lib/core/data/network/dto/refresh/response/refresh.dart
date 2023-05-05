part of data;

@JsonSerializable()
class RefreshTokenResponseDto {
  final String token;

  RefreshTokenResponseDto(this.token);

  factory RefreshTokenResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseDtoToJson(this);
}