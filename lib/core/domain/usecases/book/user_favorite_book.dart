part of domain;

@Injectable()
class GetUserFavoriteBookUseCase implements UseCase<BooksUiModel?, NoParams> {
  final BooksRepository _booksRepository;

  GetUserFavoriteBookUseCase(this._booksRepository);

  @override
  Future<BooksUiModel?> call(NoParams params) async {
    final userFavorite = await _booksRepository.getUserFavorite();
    return userFavorite?.toUiModel();
  }
}