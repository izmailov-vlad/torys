part of domain;

@Injectable()
class GetBookCommentsUseCase
    implements UseCase<List<CommentUiModel>?, GetBookCommentsParams> {
  final BooksRepository _booksRepository;

  GetBookCommentsUseCase(this._booksRepository);

  @override
  Future<List<CommentUiModel>?> call(GetBookCommentsParams params) async {
    final comments = await _booksRepository.getBookComments(
      request: GetBookCommentsRequestDto(
        bookId: params.bookId,
      ),
    );
    return comments?.map((e) => e.toUiModel()).toList();
  }
}
