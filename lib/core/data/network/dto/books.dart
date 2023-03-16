import 'package:json_annotation/json_annotation.dart';
import 'package:torys/core/data/network/dto/book.dart';

part 'books.g.dart';

@JsonSerializable()
class BooksDto {
  final List<BookDto> books;

  BooksDto(this.books);
  
  factory BooksDto.fromJson(Map<String, dynamic> json) =>
      _$BooksDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BooksDtoToJson(this);
}