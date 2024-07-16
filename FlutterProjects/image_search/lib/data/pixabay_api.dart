import 'dart:convert';

import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo_model.dart';
import 'package:http/http.dart';

class PixabayApi implements PhotoApiRepository {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '42997894-f5e29dd70ea74c8f2c2c3767c';

  @override
  Future<List<PhotoModel>> fetch(String query) async {
    List<PhotoModel> result = [];
    final url =
        Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo&pretty=true');
    final response = await get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      Iterable hits = body['hits'];

      result = hits.map((json) => PhotoModel.fromJson(json)).toList();
    }

    return result;
  }
}
