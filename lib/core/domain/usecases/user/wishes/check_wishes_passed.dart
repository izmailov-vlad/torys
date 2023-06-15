part of domain;

@Injectable()
class CheckUserSelectedWishes implements UseCase<bool, NoParams> {
  final AppSharedPreferences _appSharedPreferences;
  final AuthRepository _authRepository;

  const CheckUserSelectedWishes(
    this._appSharedPreferences,
    this._authRepository,
  );

  @override
  Future<bool> call(NoParams params) async {
    final userHaveWishes = await _authRepository.userHaveWishes();
    if (userHaveWishes == null) {
      _appSharedPreferences.resetWishes();
      return false;
    }
    if (userHaveWishes) {
      _appSharedPreferences.setWishesPassed();
    } else {
      _appSharedPreferences.resetWishes();
    }
    return _appSharedPreferences.isWishesPassed();
  }
}
