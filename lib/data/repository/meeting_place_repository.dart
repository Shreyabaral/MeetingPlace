
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Repository {
  static final Repository _repository = Repository._();
  static const int _perPage = 10;

  Repository._();

  factory Repository() {
    return _repository;
  }

  Future<dynamic> fetchImages({
    @required int page,
  }) async {
    try {
      return await http.get(
        'https://pixabay.com/api/?key=20013995-7bed7eb3ca6b91fba679e6f9a&q=hotels&image_type=photo?per_page=$_perPage',
      );
    } catch (e) {
      return e.toString();
    }
  }
}
