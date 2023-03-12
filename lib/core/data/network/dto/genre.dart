import 'package:json_annotation/json_annotation.dart';
part 'genre.g.dart';
@JsonSerializable()
class GenreDto {
  final int id;
  final String name;

  GenreDto(this.id, this.name);

  factory GenreDto.fromJson(Map<String, dynamic> json) =>
      _$GenreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GenreDtoToJson(this);

}