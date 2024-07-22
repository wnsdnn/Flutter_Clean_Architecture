import 'dart:convert';

import 'package:http/http.dart' as http;

class PixabayApi {
  final http.Client client;

  PixabayApi({
    required this.client,
  });

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '42997894-f5e29dd70ea74c8f2c2c3767c';

  Future<Iterable> fetch(String query) async {
    final url =
        Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo&pretty=true');
    // 매개변수로 넘겨져오는 client 갑싱 있다면 해당 client로 실행
    final response = await client.get(url);
    final body = jsonDecode(response.body);
    Iterable hits = body['hits'];

    return hits;
  }
}
