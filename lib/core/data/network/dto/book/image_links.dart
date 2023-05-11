part of data;

@JsonSerializable()
class ImageLinksDto {
  final String? smallThumbnail;
  final String? thumbnail;
  final String? small;
  final String? medium;
  final String? large;
  final String? extraLarge;

  ImageLinksDto({
    required this.smallThumbnail,
    required this.thumbnail,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
  });

  factory ImageLinksDto.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinksDtoToJson(this);
}