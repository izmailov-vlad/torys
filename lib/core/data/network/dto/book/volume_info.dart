part of data;

@JsonSerializable()
class VolumeInfoDto {
  final String title;
  final String? subtitle;
  final ImageLinksDto? imageLinks;
  final List<String>? authors;
  final List<String>? categories;
  final String? description;
  final int? pageCount;
  final double? averageRating;

  VolumeInfoDto({
    required this.imageLinks,
    required this.subtitle,
    required this.averageRating,
    required this.authors,
    required this.title,
    required this.categories,
    required this.description,
    required this.pageCount,
  });

  factory VolumeInfoDto.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoDtoToJson(this);
}
