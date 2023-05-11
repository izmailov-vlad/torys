part of data;

@JsonSerializable()
class ChangeLikeStatusRequestDto {
  final int commentId;

  ChangeLikeStatusRequestDto({
    required this.commentId,
  });

  factory ChangeLikeStatusRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ChangeLikeStatusRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeLikeStatusRequestDtoToJson(this);
}
