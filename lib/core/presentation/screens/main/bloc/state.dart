abstract class MainState {}

class MainInitState implements MainState{}

class MainChangeScreenState implements MainState {
  final int screenIndex;

  MainChangeScreenState(this.screenIndex);
}

enum Screen {
  home,
  favorite,
}
