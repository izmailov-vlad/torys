import '../../presentation.dart';
import '../../router/auto_router.gr.dart';
import 'book_rating.dart';

class ViewBookCard extends StatelessWidget {
  final BookUiModel book;
  final VoidCallback onFavoriteTap;

  const ViewBookCard({
    Key? key,
    required this.book, required this.onFavoriteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BaseImage(
          fit: BoxFit.contain,
          imageType: book.volumeInfo.imageLinks?.image != null ? ImageType.network : ImageType.asset,
          imagePath:
              book.volumeInfo.imageLinks?.image ?? AppImages.bookPlaceholder,
          height: 145,
          width: 100,
        ),
        SizedBox(width: AppMargin.largeMargin.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BaseText(
                      title: book.title,
                      style: context.theme.textTheme.headlineLarge?.toBold(),
                    ),
                  ),
                  BaseImage(
                    onTap: onFavoriteTap,
                    imageType: ImageType.asset,
                    imagePath: book.isFavorite
                        ? AppImages.icInFavorite
                        : AppImages.icOutFavorite,
                    height: 24,
                    width: 24,
                  )
                ],
              ),
              SizedBox(height: AppMargin.superSmallMargin.h),
              if (book.authors.isNotEmpty)
                BaseText(
                  title: book.authors.first,
                  style: context.theme.textTheme.titleLarge,
                ),
              SizedBox(height: AppMargin.superSmallMargin.h),
              BaseText(
                title: book.description,
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
                    value: book.rate,
                    size: 24,
                  ),
                  AppContainer(
                    onTap: () => context.router.push(
                      BaseWebViewRoute(
                        initialUrl: book.accessInfo.webReaderLink,
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
    );
  }
}
