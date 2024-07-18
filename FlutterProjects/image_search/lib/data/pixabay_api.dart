import 'dart:convert';

import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo_model.dart';
import 'package:http/http.dart';

class PixabayApi implements PhotoApiRepository {
  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '42997894-f5e29dd70ea74c8f2c2c3767c';

  @override
  Future<List<PhotoModel>> fetch(String query, { Client? client }) async {
    // client가 null이면 Client() 적용
    client ??= Client();

    List<PhotoModel> result = [];
    final url =
        Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo&pretty=true');
    // 매개변수로 넘겨져오는 client 갑싱 있다면 해당 client로 실행
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      Iterable hits = body['hits'];

      result = hits.map((json) => PhotoModel.fromJson(json)).toList();
    }

    return result;
  }
}
