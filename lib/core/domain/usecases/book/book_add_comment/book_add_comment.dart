part of domain;

@Injectable()
class BookAddCommentUseCase implements UseCase<bool?, AddBookCommentParams> {
  final BooksRepository _booksRepository;

  BookAddCommentUseCase(this._booksRepository);

  @override
  Future<bool?> call(params) async {
    final result = await _booksRepository.addComment(
      request: AddCommentRequestDto(comment: params.text),
      bookId: params.bookId,
    );
    return result;
  }
}
