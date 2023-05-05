part of data;

@JsonSerializable()
class BookDto {
  final String id;
  final VolumeInfoDto volumeInfo;

  BookDto({
    required this.id,
    required this.volumeInfo,
  });

  factory BookDto.fromJson(Map<String, dynamic> json) =>
      _$BookDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BookDtoToJson(this);
}
