part of domain;

abstract class GetGenresUseCase {
  Future<List<Genre>?> call();
}

@Injectable(as: GetGenresUseCase)
class GetGenresUseCaseImpl implements GetGenresUseCase {
  final BooksRepository booksRepository;

  GetGenresUseCaseImpl(this.booksRepository);

  @override
  Future<List<Genre>?> call() async {
    final genresModel = await booksRepository.getGenres();
    final genres = genresModel?.map((genre) => genre.toGenre()).toList();
    return genres;
  }
}
