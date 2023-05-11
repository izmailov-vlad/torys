part of domain;

@Injectable()
class ChangeBookCommentStatusLikeUseCase
    implements UseCase<bool?, ChangeBookCommentStatusLikeParams> {
  final BooksRepository _booksRepository;

  ChangeBookCommentStatusLikeUseCase(this._booksRepository);

  @override
  Future<bool?> call(ChangeBookCommentStatusLikeParams params) async {
    final result = await _booksRepository.changeBookLikeStatus(
      request: ChangeLikeStatusRequestDto(commentId: params.commentId),
    );
    return result;
  }
}
