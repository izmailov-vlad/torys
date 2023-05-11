part of data;

@JsonSerializable()
class AddCommentRequestDto {
  final String comment;

  AddCommentRequestDto({
    required this.comment,
  });

  factory AddCommentRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AddCommentRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddCommentRequestDtoToJson(this);
}
