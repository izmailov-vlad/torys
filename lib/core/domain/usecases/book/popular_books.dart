part of domain;

abstract class GetPopularBooksUseCase {
  Future<List<BookUiModel>?> call();
}

@Injectable(as: GetPopularBooksUseCase)
class GetPopularBooksUseCaseImpl implements GetPopularBooksUseCase {
  final BooksRepository booksRepository;

  GetPopularBooksUseCaseImpl(this.booksRepository);

  @override
  Future<List<BookUiModel>?> call() async {
    final popularBooksModel = await booksRepository.getPopularBooks(userId: 1);
    final popularBooks = popularBooksModel?.map((book) => book.toUiModel()).toList();
    return popularBooks;
  }
}
