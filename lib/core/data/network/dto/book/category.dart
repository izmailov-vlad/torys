part of data;

@JsonSerializable()
class CategoryDto {
  final int id;
  final String name;

  CategoryDto(this.id, this.name);

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

}