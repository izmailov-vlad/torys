part of data;

@JsonSerializable()
class CommentDto {
  final int id;
  final String body;
  final bool liked;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final UserDto user;
  @JsonKey(name: 'likes_count')
  final int? likesCount;

  const CommentDto(
    this.id,
    this.body,
    this.user,
    this.liked,
    this.createdAt,
    this.likesCount,
  );

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDtoToJson(this);
}
