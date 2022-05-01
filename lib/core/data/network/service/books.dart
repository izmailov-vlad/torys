import 'package:injectable/injectable.dart';
import 'package:torys/core/data/network/model/author.dart';
import 'package:torys/core/data/network/model/book.dart';
import 'package:torys/core/data/network/torys_client.dart';

abstract class BooksService {
  List<Book> getBooksByGenre();
  List<Book> getBooksByAuthor(Author author);
  List<Book> getRecommendations();
}

@Injectable(as: BooksService)
class BookServiceImpl extends BooksService {
  final TorysClient torysClient;

  BookServiceImpl(this.torysClient);
  @override
  List<Book> getBooksByAuthor(Author author) {
    // TODO: implement getBooksByAuthor
    throw UnimplementedError();
  }

  @override
  List<Book> getBooksByGenre() {
    // TODO: implement getBooksByGenre
    throw UnimplementedError();
  }

  @override
  List<Book> getRecommendations() {
    // TODO: implement getRecommendations
    throw UnimplementedError();
  }
}
