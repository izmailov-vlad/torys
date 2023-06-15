part of data;

@JsonSerializable()
class EditUserRequestDto {
  final int id;
  final String name;
  final String email;

  @JsonKey(name: 'photo')
  final Map<String, dynamic>? photo;

  const EditUserRequestDto(
    this.id,
    this.email,
    this.name,
    this.photo,
  );

  factory EditUserRequestDto.fromJson(Map<String, dynamic> json) =>
      _$EditUserRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EditUserRequestDtoToJson(this);
}
