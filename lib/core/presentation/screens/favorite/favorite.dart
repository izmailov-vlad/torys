import '../../presentation.dart';
import '../../router/auto_router.gr.dart';
import '../../widgets/book/book_rating.dart';
import 'bloc/bloc.dart';

@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBloc, FavoriteState>(
      buildWhen: (prev, curr) =>
          curr is FavoriteFetchedState || curr is FavoriteInitState,
      listenWhen: (prev, curr) => curr is FavoriteNavigateToBookState,
      listener: (context, state) => state.maybeWhen(
        navigateToBook: (id) => context.router.push(BookDetailPageRoute(
          bookId: id,
        )),
        orElse: () {},
      ),
      builder: (context, state) => state.maybeWhen(
        fetched: (books) => RefreshIndicator(
          onRefresh: () async =>
              context.read<FavoriteBloc>().add(const FavoriteEvent.init()),
          child: FavoritesList(books: books),
        ),
        orElse: () => BaseLoader(),
      ),
    );
  }
}

class FavoritesList extends StatelessWidget {
  final BooksUiModel books;

  const FavoritesList({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.items.length,
      itemBuilder: (context, index) => AppContainer(
        onTap: () => context.router.push(BookDetailPageRoute(
          bookId: books.items[index].id,
        )),
        margin: index == 0
            ? EdgeInsets.only(
                top: AppMargin.smallMargin.h,
                bottom: AppMargin.smallMargin.h,
              )
            : EdgeInsets.only(bottom: AppMargin.smallMargin.h),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Row(
          children: [
            BaseImage(
              imageType: ImageType.network,
              imagePath: books.items[index].volumeInfo.imageLinks?.image ??
                  AppImages.bookPlaceholder,
              height: 145,
              width: 115,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: BaseText(
                          title: books.items[index].title,
                          style:
                              context.theme.textTheme.headlineLarge?.toBold(),
                        ),
                      ),
                      BaseImage(
                        imageType: ImageType.asset,
                        imagePath: AppImages.icInFavorite,
                        height: 24,
                        width: 24,
                      )
                    ],
                  ),
                  SizedBox(height: AppMargin.superSmallMargin.h),
                  BaseText(
                    title: books.items[index].authors.first,
                    style: context.theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: AppMargin.superSmallMargin.h),
                  BaseText(
                    title: books.items[index].description,
                    style: context.theme.textTheme.titleLarge?.withColor(
                      AppColorsScheme.grey2,
                    ),
                    maxLines: 4,
                  ),
                  SizedBox(height: AppMargin.superSmallMargin.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BookRating(
                        onValueChanged: (int) {},
                        value: books.items[index].rate,
                        size: 24,
                      ),
                      AppContainer(
                        onTap: () => context.router.push(
                          BaseWebViewRoute(
                            initialUrl: books.items[index].accessInfo.webReaderLink,
                          ),
                        ),
                        withBorder: true,
                        borderColor: context.theme.colorScheme.primary,
                        padding: EdgeInsets.symmetric(
                          vertical: AppPadding.smallPadding.h,
                          horizontal: AppPadding.normalPadding.w,
                        ),
                        child: BaseText(
                          title: 'Читать',
                          style: context.theme.textTheme.titleLarge
                              ?.withColor(context.theme.colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
