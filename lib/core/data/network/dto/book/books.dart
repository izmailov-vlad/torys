part of data;

@JsonSerializable()
class BooksDto {
  final List<BookDto> items;

  BooksDto(this.items);
  
  factory BooksDto.fromJson(Map<String, dynamic> json) =>
      _$BooksDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BooksDtoToJson(this);
}