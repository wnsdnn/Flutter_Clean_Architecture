import 'package:flutter/material.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/presentation/home/home_screen.dart';
import 'package:image_search/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      // 감시를 할수 있는 Provider로 바꿔주기
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(
          repository: PhotoApiRepositoryImpl(
            api: PixabayApi(client: http.Client()),
          ),
        ),
        // api 객체가 child안으로 주입됨
        child: const HomeScreen(),
      ),
    ),
  );
}
