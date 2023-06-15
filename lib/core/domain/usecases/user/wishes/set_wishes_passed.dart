part of domain;

@Injectable()
class SetUserWishesPassed implements UseCase<bool, SetUserWishesPassedParams> {
  final AppSharedPreferences _appSharedPreferences;
  final BooksRepository _booksRepository;
  final AppDatabase _appDatabase;

  const SetUserWishesPassed(
    this._appSharedPreferences,
    this._booksRepository,
    this._appDatabase,
  );

  @override
  Future<bool> call(SetUserWishesPassedParams params) async {
    final result = await _booksRepository.saveUserWishes(
      request: WishesRequestDto(
        wishes: params.categoryIds
            .map((e) => WishRequestDto(categoryId: e))
            .toList(),
      ),
    );
    final user = await _appDatabase.getUser();
    if (result == null || user == null) return false;

    return result ? await _appSharedPreferences.setWishesPassed() : false;
  }
}
