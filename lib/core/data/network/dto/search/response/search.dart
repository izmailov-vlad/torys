part of data;

@JsonSerializable()
class SearchResponseDto {
  final BooksDto? books;

  const SearchResponseDto({required this.books});

  factory SearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseDtoToJson(this);
}