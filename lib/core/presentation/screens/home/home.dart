import 'package:sizer/sizer.dart';

import 'widgets/genres.dart';
import '../../widgets/base/base_loader.dart';
import '../../../../ui.dart';
import 'bloc/bloc.dart';
import 'bloc/state.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, curr) => curr is FetchedState || curr is LoadingState,
      builder: (context, state) {
        if (state is FetchedState) {
          return Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Genres(
              genres: state.genres,
            ),
          );
        }
        return const BaseLoader();
      },
    );
  }
}
