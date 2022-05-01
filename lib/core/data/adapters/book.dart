import 'package:torys/core/data/network/model/book.dart';
import 'package:torys/core/domain/entities/book.dart';

extension BookExtension on Book {
  BookDto toBookDto() {
    return BookDto(
      image: image ?? '',
      title: title ?? '',
    );
  }
}
