part of domain;

@Injectable()
class GetBookByIdUseCase implements UseCase<BookUiModel?, BookByIdParams> {
  final BooksRepository _booksRepository;

  GetBookByIdUseCase(this._booksRepository);

  @override
  Future<BookUiModel?> call(BookByIdParams params) async {
    final book = await _booksRepository.getBookById(params.id);
    return book?.toUiModel();
  }
}
