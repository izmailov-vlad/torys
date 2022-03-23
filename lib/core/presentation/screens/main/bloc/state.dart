class MainState {
  final MainScreenState mainScreenState;

  MainState({
    this.mainScreenState = MainScreenState.loading,
  });

  MainState copyWith({
    MainScreenState? mainScreenState,
  }) {
    return MainState(mainScreenState: mainScreenState ?? this.mainScreenState);
  }
}

enum MainScreenState {
  loading,
  loaded,
  error,
}
