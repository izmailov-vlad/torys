import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:torys/core/data/network/model/author.dart';
import 'package:torys/core/domain/entities/book.dart';

import '../network/torys_client.dart';

abstract class BooksRepository {
  List<BookDto> getBooksByGenre();
  List<BookDto> getBooksByAuthor(Author author);
  List<BookDto> getRecommendations();
  Future<void> getBooks();
}

@Injectable(as: BooksRepository)
class BooksRepositoryImpl extends BooksRepository {
  final TorysClient _torysClient;

  BooksRepositoryImpl(this._torysClient);
  @override
  List<BookDto> getBooksByAuthor(Author author) {
    // TODO: implement getBooksByAuthor
    throw UnimplementedError();
  }

  @override
  List<BookDto> getBooksByGenre() {
    // TODO: implement getBooksByGenre
    throw UnimplementedError();
  }

  @override
  List<BookDto> getRecommendations() {
    // TODO: implement getRecommendations
    throw UnimplementedError();
  }

  @override
  Future<void> getBooks() async {
    final response = await _torysClient.getBooks();
    log(response.title ?? 'not');
  }
}
