part of domain;

@Injectable()
class GetNewBooksUseCase implements UseCase<BooksUiModel?, NoParams> {
  final BooksRepository _booksRepository;

  GetNewBooksUseCase(this._booksRepository);

  @override
  Future<BooksUiModel?> call(NoParams params) async {
    final result = await _booksRepository.getNewBooks();
    return result?.toUiModel();
  }
}