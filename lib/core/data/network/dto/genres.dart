import 'package:json_annotation/json_annotation.dart';
import 'package:torys/core/data/network/dto/genre.dart';

part 'genres.g.dart';
@JsonSerializable()
class GenresDto {

  final List<GenreDto> genres;

  GenresDto(this.genres);

  factory GenresDto.fromJson(Map<String, dynamic> json) =>
      _$GenresDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GenresDtoToJson(this);
}