part of data;

@JsonSerializable()
class AccessInfoDto {
  final String webReaderLink;

  AccessInfoDto({
    required this.webReaderLink,
  });

  factory AccessInfoDto.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccessInfoDtoToJson(this);
}
