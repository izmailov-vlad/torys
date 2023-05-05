part of domain;

@Injectable()
class GetBooksByCategoryIdUseCase
    implements UseCase<BooksUiModel?, BooksByCategoryIdParams> {
  final BooksRepository _booksRepository;

  GetBooksByCategoryIdUseCase(this._booksRepository);

  @override
  Future<BooksUiModel?> call(params) async {
    final books = await _booksRepository.getBooksByCategoryId(params.id);
    return books?.toUiModel();
  }
}