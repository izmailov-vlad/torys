import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

import 'package:torys/injection/injection.dart';

class Interceptor {
  static String client_id = "dc72f20c6d6142728aa2072fdb33b105";
  static String client_secret = "5012eb60ee284d4bb63eb553262af578";

  static String AuthorizationStr = "$client_id:$client_secret";
  static var bytes = utf8.encode(AuthorizationStr);
  static var base64Str = base64.encode(bytes);

  String Authorization = 'Basic ' + base64Str;

  var urlToToken = Uri.parse('https://accounts.spotify.com/api/token');

  var urlToAuthorize = Uri.parse('https://accounts.spotify.com/authorize');
  Future configureNetwork() async {}
}
