import 'package:sizer/sizer.dart';

import '../../../../../ui.dart';

class AuthorName extends StatelessWidget {
  final String name;

  const AuthorName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.withColor(AppColorsScheme.grey1),
      ),
    );
  }
}
