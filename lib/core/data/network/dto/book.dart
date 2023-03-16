import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class BookDto {
  final int id;
  final String title;
  final String image;
  final String author;
  final double rate;

  BookDto({
    required this.id,
    required this.author,
    required this.rate,
    required this.image,
    required this.title,
  });

  factory BookDto.fromJson(Map<String, dynamic> json) =>
      _$BookDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BookDtoToJson(this);
}
