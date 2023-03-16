import 'package:sizer/sizer.dart';

import '../../../../../ui.dart';
import '../../../models/genre.dart';
import '../../../widgets/genre.dart';

class Genres extends StatelessWidget {
  final List<Genre> genres;

  const Genres({
    Key? key,
    required this.genres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 5.h,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          EdgeInsets padding = EdgeInsets.zero;
          if (index == 0) {
            padding = EdgeInsets.only(
              left: AppPadding.largePadding.w,
              right: AppPadding.mediumPadding.w,
            );
          } else if (index != genres.length - 1) {
            padding = EdgeInsets.only(
              right: AppPadding.mediumPadding.w,
            );
          } else {
            padding = EdgeInsets.only(
              right: AppPadding.largePadding.w,
            );
          }
          return Padding(
            padding: padding,
            child: BookGenre(
              name: genres[index].name,
            ),
          );
        },
        itemCount: genres.length,
      ),
    );
  }
}
