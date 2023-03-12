import 'package:sizer/sizer.dart';

import '../../../../../ui.dart';
import '../../../entities/genre.dart';
import '../../../widgets/book_genre.dart';

class Genres extends StatelessWidget {
  final List<Genre> genres;

  const Genres({Key? key, required this.genres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 4.h,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: index != genres.length - 1
                ? EdgeInsets.only(right: 2.w)
                : EdgeInsets.zero,
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
