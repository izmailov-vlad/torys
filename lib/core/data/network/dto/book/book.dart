part of data;

@JsonSerializable()
class BookDto {
  final String id;
  final VolumeInfoDto volumeInfo;
  final AccessInfoDto accessInfo;
  final List<CommentDto>? comments;
  final bool? isFavorite;
  final int? likesCount;
  final int? rate;

  BookDto({
    required this.id,
    required this.volumeInfo,
    required this.accessInfo,
    this.rate,
    this.comments,
    this.likesCount,
    this.isFavorite,
  });

  factory BookDto.fromJson(Map<String, dynamic> json) =>
      _$BookDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BookDtoToJson(this);
}
