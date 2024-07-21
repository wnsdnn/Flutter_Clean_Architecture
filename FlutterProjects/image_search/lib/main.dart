import 'package:flutter/material.dart';
import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/screen/home_screen.dart';
import 'package:image_search/screen/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      // PhotoProvider로 감싸주기
      home: Provider(
        create: (_) => HomeViewModel(repository: PixabayApi()),
        // api 객체가 child안으로 주입됨
        child: const HomeScreen(),
      ),
    ),
  );
}
