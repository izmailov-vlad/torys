part of data;

@JsonSerializable()
class RefreshTokenRequestDto {
  final int userId;

  RefreshTokenRequestDto(this.userId,);

  factory RefreshTokenRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenRequestDtoToJson(this);
}