import '../../../../../ui.dart';
import '../../../models/book.dart';
import '../../../widgets/app_container.dart';
import 'books_cards.dart';
import 'category_title.dart';

class BookCategory extends StatelessWidget {
  final int id;
  final String title;
  final List<Book> books;
  final Function({required int bookId}) onBookTap;
  final bool withBorder;

  const BookCategory({
    Key? key,
    required this.id,
    required this.title,
    required this.books,
    required this.onBookTap,
    this.withBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryTitle(title: title),
          BookCards(
            books: books,
            onTap: onBookTap,
            withBorder: withBorder,
          ),
        ],
      ),
    );
  }
}
