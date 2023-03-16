import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required int id,
    required String image,
    required String title,
    required String author,
    required double rate,
  }) = _Book;
}
