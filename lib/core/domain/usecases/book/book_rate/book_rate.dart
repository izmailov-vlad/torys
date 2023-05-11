part of domain;

@Injectable()
class ChangeBookRateUseCase implements UseCase<int?, BookRateParams> {
  final BooksRepository _booksRepository;

  ChangeBookRateUseCase(this._booksRepository);

  @override
  Future<int?> call(BookRateParams params) async {
    final rate = await _booksRepository.rateBook(
      request: ChangeBookRateRequestDto(
        bookId: params.bookId,
        rate: params.rate,
      ),
    );
    return rate;
  }
}