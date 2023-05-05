part of domain;

@Injectable()
class GetCategoriesUseCase
    implements UseCase<List<CategoryUIModel>?, NoParams> {
  final BooksRepository booksRepository;
  final AppDatabase _appDatabase;

  GetCategoriesUseCase(this.booksRepository, this._appDatabase);

  @override
  Future<List<CategoryUIModel>?> call(params) async {
    final categoriesDB = await _appDatabase.getCategories();
    if (categoriesDB != null && categoriesDB.isNotEmpty) {
      return categoriesDB.map((e) => e.toUiModel()).toList();
    }
    final categoriesModel = await booksRepository.getCategories();
    if (categoriesModel != null) {
      await _appDatabase.insertCategories(
          categoriesModel.map((e) => e.toCompanionModel()).toList());
    }

    final categories =
        categoriesModel?.map((genre) => genre.toUiModel()).toList();
    return categories;
  }
}
