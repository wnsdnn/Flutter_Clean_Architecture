import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo_model.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<PhotoModel> _photos = [];

  // UnmodifiableListView - 수정 못하는 리스트
  UnmodifiableListView<PhotoModel> get photos => UnmodifiableListView(_photos);

  HomeViewModel({
    required this.repository,
  });

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos = result;
    notifyListeners();
  }
}
