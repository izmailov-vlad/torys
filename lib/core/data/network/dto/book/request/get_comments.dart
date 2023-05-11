part of data;

@JsonSerializable()
class GetBookCommentsRequestDto {
  final String bookId;

  GetBookCommentsRequestDto({
    required this.bookId,
  });

  factory GetBookCommentsRequestDto.fromJson(Map<String, dynamic> json) =>
      _$GetBookCommentsRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetBookCommentsRequestDtoToJson(this);
}