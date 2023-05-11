part of domain;

@Injectable()
class BookChangeFavoriteUseCase
    implements UseCase<bool?, BookChangeFavoriteParams> {
  final BooksRepository _booksRepository;

  BookChangeFavoriteUseCase(this._booksRepository);

  @override
  Future<bool?> call(BookChangeFavoriteParams params) async {
    final result = await _booksRepository.changeBookFavorite(id: params.id);
    return result;
  }
}
