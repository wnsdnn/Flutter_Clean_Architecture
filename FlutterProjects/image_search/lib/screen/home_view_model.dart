import 'dart:async';

import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo_model.dart';

class HomeViewModel {
  final PhotoApiRepository repository;

  // InheritedWidget안에는 불변객체만 있어야함
  final _photoStreamController = StreamController<List<PhotoModel>>()
    // Controller를 생성하면서 기본값 세팅
    ..add([]);
  Stream<List<PhotoModel>> get photoStream => _photoStreamController.stream;

  HomeViewModel({
    required this.repository,
  });

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photoStreamController.add(result);
  }
}
