part of data;

@JsonSerializable()
class SearchRequestDto {
  final String query;
  final PaginationRequestDto pagination;

  SearchRequestDto({
    required this.query,
    required this.pagination,
  });

  factory SearchRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRequestDtoToJson(this);
}
