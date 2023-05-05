part of data;

@JsonSerializable()
class LogoutResponseDto {
  @Named('success')
  final bool success;

  LogoutResponseDto(this.success);

  factory LogoutResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseDtoToJson(this);
}
