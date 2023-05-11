part of data;

@JsonSerializable()
class GoogleAuthRequestDto {
  final String id;
  final String? name;
  final String email;
  final String? accessToken;

  GoogleAuthRequestDto({
    required this.id,
    required this.name,
    required this.email,
    this.accessToken,
  });

  factory GoogleAuthRequestDto.fromJson(Map<String, dynamic> json) =>
      _$GoogleAuthRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleAuthRequestDtoToJson(this);
}
