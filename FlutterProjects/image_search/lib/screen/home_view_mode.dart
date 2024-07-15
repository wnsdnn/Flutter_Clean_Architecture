import 'dart:async';

import 'package:image_search/data/api.dart';
import 'package:image_search/model/photo_model.dart';

class HomeViewModel {
  final PixabayApi api;
  // InheritedWidget안에는 불변객체만 있어야함
  final _photoStreamController = StreamController<List<PhotoModel>>()
    // Controller를 생성하면서 기본값 세팅
    ..add([]);
  Stream<List<PhotoModel>> get photoStream => _photoStreamController.stream;

  HomeViewModel({
    required this.api,
  });

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }
}
