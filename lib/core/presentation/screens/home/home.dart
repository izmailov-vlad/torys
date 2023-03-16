import 'package:sizer/sizer.dart';

import 'widgets/books_cards.dart';
import 'widgets/category.dart';
import 'widgets/genres.dart';
import '../../widgets/base/base_loader.dart';
import '../../../../ui.dart';
import 'bloc/bloc.dart';
import 'bloc/state.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, curr) => curr is FetchedState || curr is LoadingState,
      builder: (context, state) {
        if (state is FetchedState) {
          return ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              BookCategory(
                id: 1,
                title: 'Вам может понравиться',
                books: state.books,
                withBorder: true,
                onBookTap: ({required int bookId}) {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppPadding.mediumPadding.h),
                child: Genres(
                  genres: state.genres,
                ),
              ),
              BookCategory(
                id: 1,
                title: 'Популярное',
                books: state.books,
                onBookTap: ({required int bookId}) {},
              ),
            ],
          );
        }
        return const BaseLoader();
      },
    );
  }
}
