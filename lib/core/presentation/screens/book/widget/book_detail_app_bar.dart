import '../../../../../ui.dart';

class BookDetailAppBar extends StatelessWidget {
  final String? url;

  const BookDetailAppBar({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(top: 28.0, right: 16),
            child: Icon(Icons.settings,
                color: context.theme.colorScheme.surface, size: 30),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.0),
          child: InkWell(
            onTap: () => context.router.back(),
            child: Icon(Icons.chevron_left,
                color: context.theme.colorScheme.surface, size: 40),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 24, top: 16),
              child: Image.network(
                url ?? AppImages.bookPlaceholder,
                fit: BoxFit.contain,
                width: 220,
                height: 320,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
