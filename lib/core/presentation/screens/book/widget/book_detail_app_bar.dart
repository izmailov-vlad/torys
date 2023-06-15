import '../../../../../ui.dart';
import '../../../presentation.dart';
import '../gpt_bloc/bloc.dart';

class BookDetailAppBar extends StatelessWidget {
  final String? url;
  final VoidCallback onBackTap;

  const BookDetailAppBar({
    Key? key,
    required this.url,
    required this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 36, top: 56),
              child: Image.network(
                url ?? AppImages.bookPlaceholder,
                fit: BoxFit.contain,
                width: 220,
                height: 320,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 44.0),
          child: InkWell(
            onTap: onBackTap,
            child: Icon(Icons.chevron_left,
                color: context.theme.colorScheme.surface, size: 40),
          ),
        ),
      ],
    );
  }
}
