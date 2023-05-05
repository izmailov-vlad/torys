part of domain;

class CategoryBooksModel {
  final CategoryModel category;
  final List<BookModel> books;

  CategoryBooksModel({required this.books, required this.category});
}
