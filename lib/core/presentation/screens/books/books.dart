import '../../presentation.dart';
import '../../router/auto_router.gr.dart';
import 'bloc/bloc.dart';
import 'widgets/book_list_item.dart';

@RoutePage()
class BooksPage extends StatelessWidget {
  final BooksUiModel books;

  const BooksPage({
    Key? key,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Жанр',
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: books.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: AppMargin.mediumMargin.h,
                    right: AppMargin.largeMargin.w,
                    left: AppMargin.largeMargin.w,
                  ),
                  child: BookListItem(
                    title: books.items[index].title,
                    author: books.items[index].authors.isNotEmpty
                        ? books.items[index].authors.first
                        : '',
                    publishYear: 2022,
                    description: books.items[index].description,
                    imageUrl:
                        books.items[index].volumeInfo.imageLinks?.image,
                    isFavorite: false,
                    onFavoriteTap: () => context.read<BooksBloc>().add(
                          BooksEvent.onFavoriteTap(id: books.items[index].id),
                        ),
                    onTap: () {
                      context.router.push(
                        BookDetailPageRoute(bookId: books.items[index].id),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
