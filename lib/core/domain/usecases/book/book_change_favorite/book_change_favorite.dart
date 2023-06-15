part of domain;

@Injectable()
class BookChangeFavoriteUseCase
    implements UseCase<bool?, BookChangeFavoriteParams> {
  final BooksRepository _booksRepository;

  const BookChangeFavoriteUseCase(
    this._booksRepository,
  );

  @override
  Future<bool?> call(BookChangeFavoriteParams params) async {
    final isFavorite = await _booksRepository.changeBookFavorite(
      id: params.bookId,
    );
    return isFavorite;
  }
}
