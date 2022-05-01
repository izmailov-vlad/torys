import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:torys/core/data/network/model/book.dart';
import 'package:torys/core/data/network/model/user.dart';

part 'torys_client.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8000/api/')
abstract class TorysClient {
  factory TorysClient(Dio dio, {String baseUrl}) = _TorysClient;

  @GET('/books')
  Future<Book> getBooks();

  @POST('/login')
  Future<String> login(
    @Body() Map<String, dynamic> body,
  );

  @POST('/register')
  Future<String> register(
    @Body() Map<String, dynamic> body,
  );
}
