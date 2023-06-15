part of domain;

@Injectable()
class GetPopularBooksUseCase implements UseCase<List<BookUiModel>?, NoParams> {
  final BooksRepository booksRepository;

  GetPopularBooksUseCase(this.booksRepository);

  @override
  Future<List<BookUiModel>?> call(params) async {
    final popularBooksModel = await booksRepository.getPopularBooks();
    final popularBooks = popularBooksModel?.map((book) => book.toUiModel()).toList();
    return popularBooks;
  }
}
