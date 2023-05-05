part of data;

@JsonSerializable()
class CategoriesBooksDto {
  final List<CategoryBooksDto> categoriesBooks;

  CategoriesBooksDto({
    required this.categoriesBooks,
  });

  factory CategoriesBooksDto.fromJson(Map<String, dynamic> json) =>
      _$CategoriesBooksDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesBooksDtoToJson(this);
}