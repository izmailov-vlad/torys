part of data;

extension BookExtension on Book {
  Book toBookDto() {
    return Book(
      image: image ?? '',
      title: title ?? '',
    );
  }
}
