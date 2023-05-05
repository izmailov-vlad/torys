part of data;

@JsonSerializable()
class GoogleAuthResultDto {
  final String url;

  GoogleAuthResultDto(this.url);

  factory GoogleAuthResultDto.fromJson(Map<String, dynamic> json) =>
      _$GoogleAuthResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleAuthResultDtoToJson(this);
}
