import '../../../../../../ui.dart';
import '../../../../router/auto_router.gr.dart';
import '../../../../widgets/base/base_button.dart';
import '../../../../widgets/base/base_container.dart';
import '../../../../widgets/base/base_title.dart';
import 'book_detail_info.dart';

class BookDetailBodyContainer extends StatelessWidget {
  final String author;
  final String title;

  const BookDetailBodyContainer({
    Key? key,
    required this.author,
    required this.title,
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
            children: const [
              BookDetailInfo(
                title: '6.44',
                value: 'Рейтинг',
              ),
              BookDetailInfo(
                title: '6.44',
                value: 'Рейтинг',
              ),
              BookDetailInfo(
                title: '6.44',
                value: 'Рейтинг',
              ),
              BookDetailInfo(
                title: '6.44',
                value: 'Рейтинг',
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: BaseButton(
              onPressed: () {
                context.router.push(BaseWebViewRoute(
                    initialUrl:
                        'https://play.google.com/books/reader?id=Bh4uEAAAQBAJ&pg=GBS.PP6&hl=&source=gbs_api'));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: BaseText(
                  title: 'Читать',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
