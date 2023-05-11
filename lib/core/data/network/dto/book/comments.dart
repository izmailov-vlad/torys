part of data;

@JsonSerializable()
class CommentsDto {
  final List<CommentDto> data;

  CommentsDto(this.data);

  factory CommentsDto.fromJson(Map<String, dynamic> json) =>
      _$CommentsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsDtoToJson(this);

}