part of data;

@JsonSerializable()
class CategoryBooksDto {
  final CategoryDto category;
  final BooksDto books;

  CategoryBooksDto(this.books, this.category);

  factory CategoryBooksDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryBooksDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryBooksDtoToJson(this);
}
