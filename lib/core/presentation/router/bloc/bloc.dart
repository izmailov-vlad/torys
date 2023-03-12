import 'package:injectable/injectable.dart';

import '../../../../ui.dart';
import '../../provider/screen.dart';
import 'event.dart';

typedef RouteEventHandler = Stream<List<RouteInfo>>;

abstract class RouterEventSink {
  void add(RouterEvent event);
}

@Singleton(as: RouterEventSink)
class RouterBloc extends Bloc<RouterEvent, List<RouteInfo>>
    implements RouterEventSink {
  RouterBloc() : super([ScreenProvider.main()]);

  Stream<List<RouteInfo>> mapEventToState(RouterEvent event) => event.when(
        pop: _onPop,
        toMain: _toMain,
      );

  RouteEventHandler _toMain() async* {
    yield [...state, ScreenProvider.main()];
  }

  RouteEventHandler _onPop() async* {
    yield [...state..removeLast()];
  }
}
