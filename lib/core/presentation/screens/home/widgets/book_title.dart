import 'package:sizer/sizer.dart';

import '../../../../../ui.dart';

class BookTitle extends StatelessWidget {
  final String title;

  const BookTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
