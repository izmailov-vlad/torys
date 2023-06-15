part of domain;

@Injectable()
class GetUserFavoriteBookUseCase implements UseCase<BooksUiModel?, NoParams> {
  final BooksRepository _booksRepository;
  final AppDatabase _appDatabase;

  const GetUserFavoriteBookUseCase(
    this._booksRepository,
    this._appDatabase,
  );

  @override
  Future<BooksUiModel?> call(NoParams params) async {
    final userFavorite = await _booksRepository.getUserFavorite();
    return userFavorite?.toUiModel();
  }
}
