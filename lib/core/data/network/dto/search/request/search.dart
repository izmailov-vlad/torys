part of data;

@JsonSerializable()
class SearchRequestDto {
  final String query;
  // final PaginationDto pagination;

  SearchRequestDto({required this.query});

  factory SearchRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRequestDtoToJson(this);
}