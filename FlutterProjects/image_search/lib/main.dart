import 'package:flutter/material.dart';
import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/screen/home_screen.dart';
import 'package:image_search/screen/home_view_model.dart';

void main() {
  runApp(
    MaterialApp(
      // PhotoProvider로 감싸주기
      home: PhotoProvider(
        viewModel: HomeViewModel(repository: PixabayApi()),
        // api 객체가 child안으로 주입됨
        child: HomeScreen(),
      ),
    ),
  );
}
