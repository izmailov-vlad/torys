import '../../../../../../ui.dart';
import '../../../../widgets/base/base_container.dart';

class BookDetailFooterContainer extends StatelessWidget {
  final String description;

  const BookDetailFooterContainer({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Column(
        children: [
          Text(
            description,
            style: Theme.of(context).textTheme.headlineLarge?.withColor(
                  AppColorsScheme.black,
                ),
          ),
        ],
      ),
    );
  }
}
