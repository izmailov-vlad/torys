part of data;

@JsonSerializable()
class CategoriesDto {
  final List<CategoryDto> data;

  CategoriesDto(this.data);

  factory CategoriesDto.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesDtoToJson(this);
}
