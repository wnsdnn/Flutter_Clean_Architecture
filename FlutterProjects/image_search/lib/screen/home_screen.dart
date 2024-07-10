import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_search/model/photo_model.dart';
import 'package:image_search/screen/component/photo_widget.dart';
import 'package:image_search/screen/layout/default_layout.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<PhotoModel> _photos = [];

  Future<List<PhotoModel>> fetch(String query) async {
    List<PhotoModel> result = [];
    final url = Uri.parse(
        'https://pixabay.com/api/?key=42997894-f5e29dd70ea74c8f2c2c3767c&q=$query&image_type=photo&pretty=true');
    final response = await get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      Iterable hits = body['hits'];

      result = hits.map((json) => PhotoModel.fromJson(json)).toList();
    }

    return result;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        title: const Text(
          '이미지 검색 앱',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    final keyword = _controller.text;
                    final photos = await fetch(keyword);
                    print(photos);

                    setState(() {
                      _photos = photos;
                    });
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: _photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final photo = _photos[index];

                  return PhotoWidget(
                    photo: photo,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
