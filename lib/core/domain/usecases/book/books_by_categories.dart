part of domain;

@Injectable()
class GetBooksByCategories implements UseCase<CategoriesBooksUIModel?, NoParams> {
  final BooksRepository _booksRepository;
  GetBooksByCategories(this._booksRepository);

  @override
  Future<CategoriesBooksUIModel?> call(params) async {
    final booksByCategories = await _booksRepository.getBooksByCategories();
    return booksByCategories?.toUiModel();
  }
}
