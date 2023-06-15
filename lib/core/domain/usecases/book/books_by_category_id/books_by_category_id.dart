part of domain;

@Injectable()
class GetBooksByCategoryIdUseCase
    implements UseCase<BooksUiModel?, BooksByCategoryIdParams> {
  final BooksRepository _booksRepository;

  GetBooksByCategoryIdUseCase(this._booksRepository);

  @override
  Future<BooksUiModel?> call(params) async {
    final books = await _booksRepository.getBooksByCategoryId(
      id: params.id,
      pagination: PaginationRequestDto(
        startIndex: params.pagination.startIndex,
        maxResult: params.pagination.maxResult,
      ),
    );
    return books?.toUiModel();
  }
}
