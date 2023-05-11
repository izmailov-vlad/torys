import '../../../../presentation.dart';
import '../../../../router/auto_router.gr.dart';
import '../../../../widgets/base/base_container.dart';
import '../../../../widgets/book/book_rating.dart';
import '../../bloc/bloc.dart';
import 'book_detail_info.dart';

class BookDetailBodyContainer extends StatelessWidget {
  final String bookId;
  final String author;
  final String title;
  final bool isFavorite;
  final String bookWebViewUrl;
  final int pageCount;
  final double averageRating;
  final int commentsCount;
  final int likesCount;

  const BookDetailBodyContainer({
    Key? key,
    required this.author,
    required this.title,
    required this.bookWebViewUrl,
    required this.isFavorite,
    required this.bookId,
    required this.pageCount,
    required this.averageRating,
    required this.commentsCount,
    required this.likesCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Column(
        children: [
          Text(
            author,
            style: Theme.of(context).textTheme.headlineLarge?.withColor(
                  AppColorsScheme.grey1,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.displayLarge?.toBold(),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BookDetailInfo(
                value: pageCount.toString(),
                title: 'Кол-во стр',
                iconPath: AppImages.icBook,
              ),
              BookDetailInfo(
                value: averageRating.toString(),
                title: 'Рейтинг',
                iconPath: AppImages.icInFavorite,
              ),
              BookDetailInfo(
                value: commentsCount.toString(),
                title: 'Отзывы',
                iconPath: AppImages.icComment,
              ),
              BookDetailInfo(
                value: likesCount.toString(),
                title: 'Добавили',
                iconPath: AppImages.icPerson,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: BaseButton(
                  onPressed: () {
                    context.router.push(
                      BaseWebViewRoute(
                        initialUrl: bookWebViewUrl,
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: BaseText(
                      title: 'Читать',
                    ),
                  ),
                ),
              ),
              SizedBox(width: AppMargin.mediumMargin.w),
              AppContainer(
                padding: EdgeInsets.all(AppPadding.mediumPadding.w),
                withBorder: true,
                borderColor: context.theme.primaryColor,
                onTap: () => context.read<BookDetailBloc>().add(
                      BookChangeFavoriteEvent(
                        id: bookId,
                      ),
                    ),
                child: BlocBuilder<BookDetailBloc, BookDetailState>(
                  buildWhen: (prev, curr) =>
                      curr is BookDetailChangeFavoriteState,
                  builder: (context, state) => state.maybeWhen(
                    changeFavorite: (isFavorite) => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(child: child, scale: animation);
                      },
                      child: BaseImage(
                        key: ValueKey<bool>(isFavorite),
                        // Unique key for each child
                        imageType: ImageType.asset,
                        imagePath: isFavorite
                            ? AppImages.icInFavorite
                            : AppImages.icOutFavorite,
                      ),
                    ),
                    orElse: () => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(child: child, scale: animation);
                      },
                      child: BaseImage(
                        key: ValueKey<bool>(isFavorite),
                        // Unique key for each child
                        imageType: ImageType.asset,
                        imagePath: isFavorite
                            ? AppImages.icInFavorite
                            : AppImages.icOutFavorite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppMargin.mediumMargin.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BaseText(
                  title: 'Поставить\nоценку',
                  style: context.theme.textTheme.headlineLarge?.toBold()),
              BlocBuilder<BookDetailBloc, BookDetailState>(
                buildWhen: (prev, curr) =>
                    curr is BookDetailFetchState || curr is BookDetailRateState,
                builder: (context, state) => state.maybeWhen(
                  fetch: (book) => BookRating(
                    onValueChanged: (int newRate) =>
                        context.read<BookDetailBloc>().add(
                              BookDetailEvent.changeBookRate(
                                rate: newRate,
                                bookId: bookId,
                              ),
                            ),
                    value: book.rate,
                  ),
                  changeRate: (rate) => BookRating(
                    onValueChanged: (int newRate) =>
                        context.read<BookDetailBloc>().add(
                              BookDetailEvent.changeBookRate(
                                rate: newRate,
                                bookId: bookId,
                              ),
                            ),
                    value: rate,
                  ),
                  orElse: () => BookRating(
                    onValueChanged: (int newRate) =>
                        context.read<BookDetailBloc>().add(
                              BookDetailEvent.changeBookRate(
                                rate: newRate,
                                bookId: bookId,
                              ),
                            ),
                    value: 0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
