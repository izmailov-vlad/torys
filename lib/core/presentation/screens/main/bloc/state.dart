class MainState {
  final MainScreenState mainScreenState;
  final Screen currentScreen;

  MainState({
    this.currentScreen = Screen.home,
    this.mainScreenState = MainScreenState.loading,
  });

  MainState copyWith({
    Screen? currentScreen,
    MainScreenState? mainScreenState,
  }) {
    return MainState(
      currentScreen: currentScreen ?? this.currentScreen,
      mainScreenState: mainScreenState ?? this.mainScreenState,
    );
  }
}

enum Screen {
  home,
  search,
  favourite,
  profile,
}

enum MainScreenState {
  loading,
  loaded,
  error,
}
