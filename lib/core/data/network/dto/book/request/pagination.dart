part of data;

@JsonSerializable()
class PaginationRequestDto {
  final int startIndex;
  final int maxResult;

  PaginationRequestDto({
    required this.startIndex,
    required this.maxResult,
  });

  factory PaginationRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationRequestDtoToJson(this);
}