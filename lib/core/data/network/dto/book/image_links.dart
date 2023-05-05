part of data;

@JsonSerializable()
class ImageLinksDto {
  final String smallThumbnail;
  final String thumbnail;

  ImageLinksDto({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  factory ImageLinksDto.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinksDtoToJson(this);
}
