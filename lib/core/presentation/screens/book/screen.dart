import '../../presentation.dart';
import 'bloc/bloc.dart';
import 'widget/book_detail_app_bar.dart';
import 'widget/book_detail_body/book_detail_body_container.dart';
import 'widget/book_detail_body/book_detail_footer_container.dart';

@RoutePage()
class BookDetailPage extends StatelessWidget implements AutoRouteWrapper {
  final BookUiModel book;

  const BookDetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => AppProvider(child: this);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      emptyTop: true,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return BlocBuilder<BookDetailBloc, BookDetailState>(
              buildWhen: (prev, curr) => curr is BookDetailInitState,
              builder: (context, state) {
                return state.when(
                  init: () => SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraint.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: BookDetailAppBar(
                                url: book.imageLinks.first,
                              ),
                            ),
                            BookDetailBodyContainer(
                              author: book.authors.first,
                              title: book.title,
                            ),
                            const SizedBox(height: 8),
                            BookDetailFooterContainer(
                              description: book.description,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
