part of domain;

extension BookExtension on BookModel {
  Book toBook() {
    return Book(
      id: id,
      image: image,
      title: title,
      author: author,
      rate: rate,
    );
  }
}
