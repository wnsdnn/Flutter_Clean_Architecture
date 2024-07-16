import 'package:image_search/model/photo_model.dart';

abstract class PhotoApiRepository {
  Future<List<PhotoModel>> fetch(String query);
}