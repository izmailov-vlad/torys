part of domain;

@Injectable()
class GetBooksByQueryUseCase implements UseCase<BooksUiModel?, BooksByQueryParams> {
  final BooksRepository _booksRepository;

  GetBooksByQueryUseCase(this._booksRepository);

  @override
  Future<BooksUiModel?> call(BooksByQueryParams params) async {
    final booksModel = await _booksRepository.getBooksByQuery(
      request: SearchRequestDto(query: params.query),
    );
    return booksModel?.toUiModel();
  }
}
